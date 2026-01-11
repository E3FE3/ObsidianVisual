#!/bin/bash
# Автоматическая синхронизация WSL проекта в Windows Obsidian Vault
# Использование: ./sync-to-windows.sh

set -e

# Конфигурация путей
WSL_SOURCE="/home/e3fe3/lab/obsidian/launcher"
WIN_TARGET="/mnt/c/Users/E3FE3/Folder_F/Projects/Obsidian/Vaults/LAUNCHER"

# Цвета
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${BLUE}[$(date '+%H:%M:%S')]${NC} $1"
}

# 1. Проверка существования путей
if [ ! -d "$WIN_TARGET" ]; then
    echo -e "${RED}Ошибка: Целевая директория в Windows не найдена: $WIN_TARGET${NC}"
    exit 1
fi

log "Начало синхронизации в $WIN_TARGET..."

# 2. Backup текущей конфигурации в Windows (только .obsidian)
BACKUP_NAME="obsidian_backup_$(date +%Y%m%d_%H%M%S)"
log "Создание бэкапа конфигурации в Windows..."
mkdir -p "$WIN_TARGET/.backups"
if [ -d "$WIN_TARGET/.obsidian" ]; then
    cp -r "$WIN_TARGET/.obsidian" "$WIN_TARGET/.backups/$BACKUP_NAME"
fi

# 3. Синхронизация файлов через rsync
# Исключаем .git, .windsurf и временные файлы
log "Копирование файлов из WSL в Windows..."
rsync -av --progress \
    --exclude='.git/' \
    --exclude='.windsurf/' \
    --exclude='.gitignore' \
    --exclude='.obsidian/workspace' \
    --exclude='.obsidian/workspace.json' \
    --exclude='.obsidian/workspace-mobile.json' \
    --exclude='*.tmp' \
    --exclude='*~' \
    "$WSL_SOURCE/" "$WIN_TARGET/"

# 4. Особая обработка CSS Snippets
log "Обновление CSS сниппетов..."
mkdir -p "$WIN_TARGET/.obsidian/snippets"
cp "$WSL_SOURCE/.obsidian/snippets/dashboard.css" "$WIN_TARGET/.obsidian/snippets/dashboard.css"

# 5. Проверка результата
log "✅ Синхронизация завершена успешно!"
echo -e "${YELLOW}Рекомендации:${NC}"
echo "1. Перезагрузите Obsidian в Windows (Ctrl+R)"
echo "2. Проверьте, что сниппет 'dashboard.css' включен в настройках"
echo "3. Откройте Home.md для проверки интерфейса"
