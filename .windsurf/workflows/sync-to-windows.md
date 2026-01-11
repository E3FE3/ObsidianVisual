# Workflow: Синхронизация LAUNCHER с Windows

**Триггер**: `/sync-windows`

**Назначение**: Синхронизировать изменения WSL LAUNCHER проекта в Windows Obsidian vault

## Пути

- **WSL источник**: `/home/e3fe3/lab/obsidian/launcher/`
- **Windows назначение**: `/mnt/c/Users/E3FE3/Folder_F/Projects/Obsidian/Vaults/LAUNCHER/`

## Шаги

1. **Проверить изменения**
   - Перечислить изменённые файлы в WSL проекте
   - Показать git status если применимо
   - Спросить пользователя подтвердить синхронизацию

2. **Backup критичных файлов**
   - Создать timestamped backup Windows `.obsidian/` папки
   - Backup команда: `cp -r target/.obsidian target/.obsidian.backup.$(date +%Y%m%d_%H%M%S)`

3. **Синхронизировать CSS**
   ```bash
   cp /home/e3fe3/lab/obsidian/launcher/.obsidian/snippets/dashboard.css \
      /mnt/c/Users/E3FE3/Folder_F/Projects/Obsidian/Vaults/LAUNCHER/.obsidian/snippets/dashboard.css
   ```

4. **Синхронизировать файлы контента**
   - Dashboard файлы: `_Dashboard/*.md`
   - Новые команды: `Snippets/*.md`, `Scripts/*.md`
   - Шаблоны: `_Templates/*.md`
   - Документация: `README.md`, `SETUP.md`

5. **Синхронизировать конфигурацию**
   - `.obsidian/snippets/` (все CSS файлы)
   - `.obsidian/themes/` если есть кастомные темы

6. **Проверить синхронизацию**
   - Сравнить размеры файлов
   - Проверить timestamps модификации
   - Перечислить синхронизированные файлы

7. **Тестировать в Obsidian**
   - Рекомендовать пользователю:
     - Перезагрузить Obsidian (Ctrl+R)
     - Проверить что CSS snippet включён
     - Открыть Home.md в Reading mode
     - Проверить что изменения применились

## Меры безопасности

- Никогда не удалять файлы, только копировать/перезаписывать
- Всегда создавать backup перед синхронизацией
- Показывать summary изменений перед выполнением
- Разрешать пользователю прервать на любом шаге

## Ожидаемый результат

- Файлы синхронизированы из WSL в Windows
- Backup создан с timestamp
- Summary скопированных файлов
- Инструкции для перезагрузки Obsidian

## Заметки

- Запускать этот workflow после улучшений CSS
- Также запускать после создания нескольких новых команд
- Можно автоматизировать с git push/pull если vault отслеживается git
