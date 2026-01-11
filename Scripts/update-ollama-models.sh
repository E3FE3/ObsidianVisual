#!/bin/bash
# Массовое обновление Ollama моделей на TheYvnAI
# Использование: ./update-ollama-models.sh [model_name|all]

set -e

# Конфигураção
THEYVNAI_SSH="admin@159.195.65.72 -p 11011"
LOG_FILE="/var/log/ollama-update.log"
OLLAMA_MODELS_DIR="$HOME/.ollama/models"

# Список моделей для обновления
declare -A MODELS=(
    ["llama2"]="meta/llama-2"
    ["codellama"]="codellama/codellama"
    ["mistral"]="mistralai/mistral"
    ["neural-chat"]="neuralchat/neural-chat"
    ["llama2-13b"]="meta/llama-2:13b"
    ["qwen"]="qwen/qwen"
)

# Цвета
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Логирование
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Проверка подключения
check_connection() {
    log "Проверка подключения к TheYvnAI..."
    if ssh $THEYVNAI_SSH "echo 'OK'" >/dev/null 2>&1; then
        log "✅ Подключение успешно"
        return 0
    else
        log "❌ Ошибка подключения"
        exit 1
    fi
}

# Проверка статуса Ollama
check_ollama_status() {
    log "Проверка статуса Ollama..."
    local status=$(ssh $THEYVNAI_SSH "systemctl is-active ollama" 2>/dev/null)
    
    if [[ "$status" == "active" ]]; then
        log "✅ Ollama запущен"
        return 0
    else
        log "❌ Ollama не запущен. Попытка запуска..."
        ssh $THEYVNAI_SSH "sudo systemctl start ollama"
        sleep 5
        return 1
    fi
}

# Получение списка установленных моделей
get_installed_models() {
    log "Получение списка установленных моделей..."
    ssh $THEYVNAI_SSH "ollama list 2>/dev/null | tail -n +2 | awk '{print \$1}'"
}

# Проверка доступных обновлений
check_updates() {
    local model=$1
    log "Проверка обновлений для модели: $model"
    
    # Получение текущей версии
    local current=$(ssh $THEYVNAI_SSH "ollama list 2>/dev/null | grep '^$model ' | awk '{print \$2}' || echo 'unknown'")
    
    # Симуляция проверки новой версии (в реальности нужно API)
    echo -e "${YELLOW}Текущая версия $model: $current${NC}"
    echo -e "${BLUE}Доступно обновление для $model${NC}"
    
    return 0
}

# Обновление модели
update_model() {
    local model=$1
    
    log "Начало обновления модели: $model"
    
    # Остановка модели если она загружена
    ssh $THEYVNAI_SSH "ollama stop $model" 2>/dev/null || true
    
    # Создание бэкапа
    log "Создание бэкапа модели $model..."
    local backup_name="${model}_backup_$(date +%Y%m%d_%H%M%S)"
    ssh $THEYVNAI_SSH "cp -r $OLLAMA_MODELS_DIR/manifests/registry.ollama.ai/library/$model $OLLAMA_MODELS_DIR/backups/$backup_name 2>/dev/null || true"
    
    # Загрузка обновления
    log "Загрузка обновления для $model..."
    if ssh $THEYVNAI_SSH "ollama pull $model"; then
        log "✅ Модель $model успешно обновлена"
        
        # Проверка после обновления
        if ssh $THEYVNAI_SSH "ollama show $model" >/dev/null 2>&1; then
            log "✅ Модель $model корректно загружена"
            return 0
        else
            log "❌ Ошибка: модель $model не загружается"
            return 1
        fi
    else
        log "❌ Ошибка обновления модели $model"
        
        # Восстановление из бэкапа
        log "Восстановление $model из бэкапа..."
        ssh $THEYVNAI_SSH "cp -r $OLLAMA_MODELS_DIR/backups/$backup_name $OLLAMA_MODELS_DIR/manifests/registry.ollama.ai/library/$model 2>/dev/null || true"
        return 1
    fi
}

# Обновление всех моделей
update_all_models() {
    log "Начало массового обновления всех моделей..."
    
    local installed=$(get_installed_models)
    local updated=0
    local failed=0
    
    for model in $installed; do
        echo ""
        echo -e "${BLUE}========================================${NC}"
        
        if check_updates "$model"; then
            if update_model "$model"; then
                ((updated++))
            else
                ((failed++))
            fi
        fi
        
        echo -e "${BLUE}========================================${NC}"
    done
    
    echo ""
    log "📊 Итоги обновления:"
    log "   Обновлено: $updated"
    log "   Ошибок: $failed"
}

# Очистка старых бэкапов
cleanup_backups() {
    log "Очистка старых бэкапов (старше 7 дней)..."
    ssh $THEYVNAI_SSH "find $OLLAMA_MODELS_DIR/backups -type d -mtime +7 -exec rm -rf {} \; 2>/dev/null || true"
}

# Проверка дискового пространства
check_disk_space() {
    log "Проверка дискового пространства..."
    local usage=$(ssh $THEYVNAI_SSH "df $OLLAMA_MODELS_DIR | tail -1 | awk '{print \$5}' | sed 's/%//'")
    
    if [ "$usage" -gt 90 ]; then
        log "⚠️ Внимание: Дисковое пространство для моделей $usage%"
        
        # Показать размеры моделей
        echo ""
        log "Размеры моделей:"
        ssh $THEYVNAI_SSH "du -sh $OLLAMA_MODELS_DIR/manifests/registry.ollama.ai/library/* 2>/dev/null | sort -hr"
        
        return 1
    else
        log "✅ Дискового пространства достаточно: $usage%"
        return 0
    fi
}

# Перезапуск Ollama после обновлений
restart_ollama() {
    log "Перезапуск Ollama для применения изменений..."
    ssh $THEYVNAI_SSH "sudo systemctl restart ollama"
    sleep 10
    
    if ssh $THEYVNAI_SSH "systemctl is-active ollama" | grep -q "active"; then
        log "✅ Ollama успешно перезапущен"
    else
        log "❌ Ошибка перезапуска Ollama"
        return 1
    fi
}

# Отправка отчета
send_report() {
    local model_count=$(ssh $THEYVNAI_SSH "ollama list 2>/dev/null | tail -n +2 | wc -l")
    local total_size=$(ssh $THEYVNAI_SSH "du -sh $OLLAMA_MODELS_DIR 2>/dev/null | cut -f1")
    
    echo ""
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}                    ОТЧЕТ ОБНОВЛЕНИЯ                           ${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "Моделей установлено: $model_count"
    echo -e "Общий размер: $total_size"
    echo -e "Лог: $LOG_FILE"
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════${NC}"
    
    # Отправка email если настроен
    if command -v mail >/dev/null 2>&1; then
        {
            echo "Отчет об обновлении Ollama моделей"
            echo "Дата: $(date)"
            echo "Моделей: $model_count"
            echo "Размер: $total_size"
            echo ""
            tail -20 "$LOG_FILE"
        } | mail -s "Ollama Models Update Report" admin@example.com
    fi
}

# Основная функция
main() {
    local target=${1:-all}
    
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}                ОБНОВЛЕНИЕ OLLAMA МОДЕЛЕЙ                       ${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    # Создание лог файла
    mkdir -p "$(dirname "$LOG_FILE")"
    
    # Проверки
    check_connection
    check_ollama_status || exit 1
    check_disk_space || { log "Освободите место на диске и повторите попытку"; exit 1; }
    
    # Обновление
    case $target in
        "all")
            update_all_models
            ;;
        *)
            if [[ -n "${MODELS[$target]}" ]]; then
                check_updates "$target"
                update_model "$target"
            else
                log "❌ Неизвестная модель: $target"
                echo "Доступные модели: ${!MODELS[*]}"
                exit 1
            fi
            ;;
    esac
    
    # Завершающие операции
    cleanup_backups
    restart_ollama
    send_report
    
    log "✅ Обновление завершено"
}

# Обработка сигналов
trap 'echo -e "\n${YELLOW}Обновление прервано${NC}"; exit 1' INT TERM

# Запуск
main "$@"
