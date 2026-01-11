#!/bin/bash
# Полный бэкап всех VPS серверов
# Использование: ./full-backup.sh [daily|weekly|monthly]

set -e

# Конфигурация
BACKUP_TYPE=${1:-daily}
BACKUP_DIR="/backup"
RETENTION_DAYS=30
DATE=$(date +%Y%m%d_%H%M%S)

# Серверы
declare -A SERVERS=(
    ["theyvnhub"]="grem@80.71.224.134"
    ["theyvnai"]="admin@159.195.65.72 -p 11011"
)

# Логирование
LOG_FILE="$BACKUP_DIR/logs/backup_$DATE.log"
mkdir -p "$BACKUP_DIR/logs"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Проверка подключения
check_connection() {
    local server=$1
    local ssh_cmd=$2
    
    log "Проверка подключения к $server..."
    if ssh $ssh_cmd "echo 'OK'" >/dev/null 2>&1; then
        log "✅ Подключение к $server успешно"
        return 0
    else
        log "❌ Ошибка подключения к $server"
        return 1
    fi
}

# Бэкап сервера
backup_server() {
    local server=$1
    local ssh_cmd=$2
    
    log "Начало бэкапа $server..."
    
    # Создание директории для бэкапа
    local backup_path="$BACKUP_DIR/$BACKUP_TYPE/$server/$DATE"
    mkdir -p "$backup_path"
    
    # Бэкап файлов
    log "Создание бэкапа файлов $server..."
    ssh $ssh_cmd "sudo tar -czf /tmp/files_$DATE.tar.gz /var/www /etc/nginx /etc/ssh /home 2>/dev/null || true"
    scp $ssh_cmd:/tmp/files_$DATE.tar.gz "$backup_path/"
    
    # Бэкап баз данных
    if [[ "$server" == "theyvnai" ]]; then
        log "Бэкап PostgreSQL и Redis на $server..."
        ssh $ssh_cmd "sudo -u postgres pg_dumpall > /tmp/postgres_$DATE.sql 2>/dev/null || true"
        ssh $ssh_cmd "redis-cli BGSAVE && sleep 5"
        scp $ssh_cmd:/tmp/postgres_$DATE.sql "$backup_path/"
        scp $ssh_cmd:/var/lib/redis/dump.rdb "$backup_path/redis_$DATE.rdb" 2>/dev/null || true
    fi
    
    # Бэкап списка пакетов
    log "Сохранение списка пакетов $server..."
    ssh $ssh_cmd "dpkg --get-selections > /tmp/packages_$DATE.list 2>/dev/null || true"
    scp $ssh_cmd:/tmp/packages_$DATE.list "$backup_path/"
    
    # Очистка временных файлов
    ssh $ssh_cmd "rm -f /tmp/*_$DATE.*"
    
    # Создание контрольной суммы
    cd "$backup_path"
    sha256sum * > checksums.txt
    
    log "✅ Бэкап $server завершен"
}

# Очистка старых бэкапов
cleanup_old_backups() {
    log "Очистка старых бэкапов старше $RETENTION_DAYS дней..."
    find "$BACKUP_DIR" -type d -mtime +$RETENTION_DAYS -exec rm -rf {} \; 2>/dev/null || true
}

# Проверка дискового пространства
check_disk_space() {
    log "Проверка дискового пространства..."
    local usage=$(df "$BACKUP_DIR" | tail -1 | awk '{print $5}' | sed 's/%//')
    
    if [ "$usage" -gt 90 ]; then
        log "⚠️ Внимание: Дисковое пространство $usage% > 90%"
        # Отправка уведомления
        echo "Внимание: Дисковое пространство для бэкапов заполнено на $usage%" | \
        mail -s "Backup Warning" admin@example.com 2>/dev/null || true
    fi
}

# Отправка отчета
send_report() {
    local total_size=$(du -sh "$BACKUP_DIR/$BACKUP_TYPE" | cut -f1)
    local backup_count=$(find "$BACKUP_DIR/$BACKUP_TYPE" -name "*.tar.gz" | wc -l)
    
    log "📊 Отчет о бэкапе:"
    log "   Тип: $BACKUP_TYPE"
    log "   Размер: $total_size"
    log "   Файлов: $backup_count"
    log "   Лог: $LOG_FILE"
    
    # Отправка email (если настроен)
    if command -v mail >/dev/null 2>&1; then
        {
            echo "Отчет о бэкапе ($BACKUP_TYPE)"
            echo "Дата: $(date)"
            echo "Размер: $total_size"
            echo "Файлов: $backup_count"
            echo ""
            tail -20 "$LOG_FILE"
        } | mail -s "Backup Report - $BACKUP_TYPE" admin@example.com
    fi
}

# Основной процесс
main() {
    log "=== Начало бэкапа ($BACKUP_TYPE) ==="
    
    # Проверка root прав
    if [ "$EUID" -ne 0 ]; then
        log "⚠️ Рекомендуется запускать с sudo для корректного бэкапа"
    fi
    
    # Проверка дискового пространства
    check_disk_space
    
    # Бэкап каждого сервера
    for server in "${!SERVERS[@]}"; do
        if check_connection "$server" "${SERVERS[$server]}"; then
            backup_server "$server" "${SERVERS[$server]}"
        else
            log "Пропуск бэкапа $server из-за ошибки подключения"
        fi
    done
    
    # Очистка
    cleanup_old_backups
    
    # Отчет
    send_report
    
    log "=== Бэкап завершен ==="
}

# Запуск
main "$@"
