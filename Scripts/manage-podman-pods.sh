#!/bin/bash
# Управление Podman Pods и контейнерами на TheYvnHub
# Использование: ./manage-podman-pods.sh [command] [pod_name]

set -e

# Конфигурация
THEYVNHUB_SSH="grem@80.71.224.134"
LOG_FILE="/var/log/podman-mgmt.log"

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
    log "Проверка подключения к TheYvnHub..."
    if ssh $THEYVNHUB_SSH "echo 'OK'" >/dev/null 2>&1; then
        log "✅ Подключение успешно"
        return 0
    else
        log "❌ Ошибка подключения"
        exit 1
    fi
}

# Список подов
list_pods() {
    log "Список Podman Pods:"
    ssh $THEYVNHUB_SSH "podman pod ps"
}

# Список контейнеров в поде
list_containers() {
    local pod=$1
    if [[ -z "$pod" ]]; then
        log "Список всех контейнеров:"
        ssh $THEYVNHUB_SSH "podman ps -a --pod"
    else
        log "Список контейнеров в поде $pod:"
        ssh $THEYVNHUB_SSH "podman ps -a --filter pod=$pod"
    fi
}

# Старт пода
start_pod() {
    local pod=$1
    if [[ -z "$pod" ]]; then echo "Укажите имя пода"; exit 1; fi
    log "Запуск пода $pod..."
    ssh $THEYVNHUB_SSH "podman pod start $pod"
}

# Стоп пода
stop_pod() {
    local pod=$1
    if [[ -z "$pod" ]]; then echo "Укажите имя пода"; exit 1; fi
    log "Остановка пода $pod..."
    ssh $THEYVNHUB_SSH "podman pod stop $pod"
}

# Перезапуск пода
restart_pod() {
    local pod=$1
    if [[ -z "$pod" ]]; then echo "Укажите имя пода"; exit 1; fi
    log "Перезапуск пода $pod..."
    ssh $THEYVNHUB_SSH "podman pod restart $pod"
}

# Просмотр логов пода
logs_pod() {
    local pod=$1
    if [[ -z "$pod" ]]; then echo "Укажите имя пода"; exit 1; fi
    log "Логи пода $pod:"
    ssh $THEYVNHUB_SSH "podman pod logs -f $pod"
}

# Инспекция пода
inspect_pod() {
    local pod=$1
    if [[ -z "$pod" ]]; then echo "Укажите имя пода"; exit 1; fi
    ssh $THEYVNHUB_SSH "podman pod inspect $pod"
}

# Очистка неиспользуемых ресурсов
cleanup() {
    log "Очистка неиспользуемых ресурсов Podman..."
    ssh $THEYVNHUB_SSH "podman system prune -f"
}

# Вывод помощи
show_help() {
    echo "Использование: $0 [command] [pod_name]"
    echo ""
    echo "Команды:"
    echo "  ls, list        Список всех подов"
    echo "  ps              Список всех контейнеров"
    echo "  start [pod]     Запустить под"
    echo "  stop [pod]      Остановить под"
    echo "  restart [pod]   Перезапустить под"
    echo "  logs [pod]      Просмотр логов пода"
    echo "  inspect [pod]   Инспекция пода"
    echo "  prune           Очистка системы"
    echo "  help            Показать эту справку"
}

# Основная логика
main() {
    local cmd=${1:-list}
    local pod=$2
    
    check_connection
    
    case $cmd in
        ls|list)      list_pods ;;
        ps)           list_containers "$pod" ;;
        start)        start_pod "$pod" ;;
        stop)         stop_pod "$pod" ;;
        restart)      restart_pod "$pod" ;;
        logs)         logs_pod "$pod" ;;
        inspect)      inspect_pod "$pod" ;;
        prune)        cleanup ;;
        help|--help|-h) show_help ;;
        *)            log "❌ Неизвестная команда: $cmd"; show_help; exit 1 ;;
    esac
}

# Запуск
main "$@"
