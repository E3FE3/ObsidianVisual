#!/bin/bash
# Мониторинг всех серверов в реальном времени
# Использование: ./server-monitor.sh [refresh_interval]

set -e

# Конфигурация
REFRESH_INTERVAL=${1:-5}
LOG_FILE="/var/log/server-monitor.log"

# Серверы
declare -A SERVERS=(
    ["theyvnhub"]="grem@80.71.224.134"
    ["theyvnai"]="admin@159.195.65.72 -p 11011"
    ["wsl"]="localhost"
)

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Функции для получения метрик
get_uptime() {
    local ssh_cmd=$1
    if [[ "$ssh_cmd" == "localhost" ]]; then
        uptime | awk -F'load average:' '{print $2}' | sed 's/^[ \t]*//'
    else
        ssh $ssh_cmd "uptime | awk -F'load average:' '{print \$2}' | sed 's/^[ \t]*//'" 2>/dev/null || "N/A"
    fi
}

get_memory() {
    local ssh_cmd=$1
    if [[ "$ssh_cmd" == "localhost" ]]; then
        free | grep Mem | awk '{printf "%.0f%%", $3/$2 * 100.0}'
    else
        ssh $ssh_cmd "free | grep Mem | awk '{printf \"%.0f%%\", \$3/\$2 * 100.0}'" 2>/dev/null || "N/A"
    fi
}

get_disk() {
    local ssh_cmd=$1
    if [[ "$ssh_cmd" == "localhost" ]]; then
        df / | tail -1 | awk '{print $5}'
    else
        ssh $ssh_cmd "df / | tail -1 | awk '{print \$5}'" 2>/dev/null || "N/A"
    fi
}

get_cpu() {
    local ssh_cmd=$1
    if [[ "$ssh_cmd" == "localhost" ]]; then
        top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//'
    else
        ssh $ssh_cmd "top -bn1 | grep 'Cpu(s)' | awk '{print \$2}' | sed 's/%us,//'" 2>/dev/null || "N/A"
    fi
}

check_service() {
    local ssh_cmd=$1
    local service=$2
    
    if [[ "$ssh_cmd" == "localhost" ]]; then
        systemctl is-active $service >/dev/null 2>&1 && echo "✅" || echo "❌"
    else
        ssh $ssh_cmd "systemctl is-active $service" >/dev/null 2>&1 && echo "✅" || echo "❌"
    fi
}

# Проверка порта
check_port() {
    local host=$1
    local port=$2
    
    if [[ "$host" == "localhost" ]]; then
        netstat -tlnp 2>/dev/null | grep ":$port " >/dev/null && echo "✅" || echo "❌"
    else
        timeout 1 bash -c "</dev/tcp/$host/$port" >/dev/null 2>&1 && echo "✅" || echo "❌"
    fi
}

# Вывод заголовка
print_header() {
    clear
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}                    СЕРВЕРНЫЙ МОНИТОР                           ${NC}"
    echo -e "${BLUE}               Обновление каждые ${REFRESH_INTERVAL} сек                     ${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

# Вывод информации о сервере
print_server_info() {
    local server=$1
    local ssh_cmd=${SERVERS[$server]}
    
    # Получение метрик
    local uptime=$(get_uptime "$ssh_cmd")
    local memory=$(get_memory "$ssh_cmd")
    local disk=$(get_disk "$ssh_cmd")
    local cpu=$(get_cpu "$ssh_cmd")
    
    # Определение цвета для метрик
    if [[ ${memory%\%} -gt 80 ]]; then
        memory_color=$RED
    elif [[ ${memory%\%} -gt 60 ]]; then
        memory_color=$YELLOW
    else
        memory_color=$GREEN
    fi
    
    if [[ ${disk%\%} -gt 90 ]]; then
        disk_color=$RED
    elif [[ ${disk%\%} -gt 80 ]]; then
        disk_color=$YELLOW
    else
        disk_color=$GREEN
    fi
    
    if [[ ${cpu%.*} -gt 80 ]]; then
        cpu_color=$RED
    elif [[ ${cpu%.*} -gt 60 ]]; then
        cpu_color=$YELLOW
    else
        cpu_color=$GREEN
    fi
    
    # Вывод информации
    echo -e "${BLUE}Сервер: ${server^^}${NC}"
    echo -e "   Адрес: $ssh_cmd"
    echo -e "   Load:   $uptime"
    echo -e "   CPU:    ${cpu_color}$cpu%${NC}"
    echo -e "   RAM:    ${memory_color}$memory${NC}"
    echo -e "   Disk:   ${disk_color}$disk${NC}"
    
    # Проверка сервисов
    case $server in
        "theyvnhub")
            echo -e "   Nginx:  $(check_service "$ssh_cmd" nginx)"
            echo -e "   SSH:    $(check_service "$ssh_cmd" ssh)"
            echo -e "   Port 80: $(check_port "80.71.224.134" "80")"
            echo -e "   Port 443: $(check_port "80.71.224.134" "443")"
            ;;
        "theyvnai")
            echo -e "   Ollama: $(check_service "$ssh_cmd" ollama)"
            echo -e "   LiteLLM: $(check_service "$ssh_cmd" litellm)"
            echo -e "   PostgreSQL: $(check_service "$ssh_cmd" postgresql)"
            echo -e "   Redis: $(check_service "$ssh_cmd" redis)"
            echo -e "   Port 11434: $(check_port "159.195.65.72" "11434")"
            echo -e "   Port 4000: $(check_port "159.195.65.72" "4000")"
            ;;
        "wsl")
            echo -e "   Docker: $(check_service "$ssh_cmd" docker)"
            echo -e "   Podman: $(command -v podman >/dev/null && echo "✅" || echo "❌")"
            ;;
    esac
    echo ""
}

# Проверка предупреждений
check_alerts() {
    local alerts=0
    
    for server in "${!SERVERS[@]}"; do
        local ssh_cmd=${SERVERS[$server]}
        local memory=$(get_memory "$ssh_cmd")
        local disk=$(get_disk "$ssh_cmd")
        
        if [[ ${memory%\%} -gt 80 ]]; then
            echo -e "${RED}⚠️ ВНИМАНИЕ: Высокое использование RAM на $server: $memory${NC}"
            ((alerts++))
        fi
        
        if [[ ${disk%\%} -gt 90 ]]; then
            echo -e "${RED}⚠️ ВНИМАНИЕ: Мало места на диске $server: $disk${NC}"
            ((alerts++))
        fi
    done
    
    if [ $alerts -eq 0 ]; then
        echo -e "${GREEN}✅ Все системы в норме${NC}"
    fi
}

# Сохранение в лог
log_status() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] Monitor check completed" >> "$LOG_FILE"
}

# Основной цикл
main() {
    # Проверка зависимостей
    for cmd in ssh netstat; do
        if ! command -v $cmd >/dev/null; then
            echo "Ошибка: $cmd не установлен"
            exit 1
        fi
    done
    
    # Создание лог файла
    mkdir -p "$(dirname "$LOG_FILE")"
    
    # Бесконечный цикл
    while true; do
        print_header
        
        for server in "${!SERVERS[@]}"; do
            print_server_info "$server"
        done
        
        echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
        echo ""
        check_alerts
        echo ""
        echo -e "${BLUE}Нажмите Ctrl+C для выхода${NC}"
        
        log_status
        sleep $REFRESH_INTERVAL
    done
}

# Запуск
trap 'echo -e "\n${YELLOW}Мониторинг остановлен${NC}"; exit 0' INT
main "$@"
