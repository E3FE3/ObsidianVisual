# TheYvnHub

Инфраструктурный VPS сервер.

## Информация о сервере
- **IP:** 80.71.224.134
- **Порт:** 22
- **Пользователь:** grem
- **SSH ключ:** ~/.ssh/theyvnhub_key

## Сервисы
- **Plane** - Управление проектами
- **n8n** - Автоматизация workflow
- **Gitea** - Хостинг Git репозиториев

## Команды для TheYvnHub

```dataview
TABLE technology AS "Технология", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE system = "TheYvnHub"
SORT file.name ASC
```

## Быстрый доступ
```bash
# SSH подключение
ssh grem@80.71.224.134

# Монтирование через rclone (из Windows)
rclone mount theyvnhub: V: --vfs-cache-mode full
```

## Связанные
- [[Systems/VPS/VPS|🌐 Все VPS серверы]]
- [[The Yvn AI/TheYvnAI|🌐 TheYvnAI]] - AI сервер
- [[Technologies/ssh|🔑 ssh]] - Команды SSH
- [[Technologies/rclone|🔐 rclone]] - Команды монтирования
