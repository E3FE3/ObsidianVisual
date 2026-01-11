# 🌐 VPS

Инфраструктура виртуальных частных серверов.

## Описание
Команды и конфигурации для управления удалёнными VPS серверами.

## Серверы
- [[TheYvnHub]] - Инфраструктурный сервер (Plane, n8n, Gitea)
- [[TheYvnAI]] - AI сервер (Ollama, LiteLLM)

## Все команды VPS

```dataview
TABLE system AS "Сервер", technology AS "Технология", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE system = "TheYvnHub" OR system = "TheYvnAI"
SORT system ASC, file.name ASC
```

## Связанные
- [[Home]] - Назад в dashboard
- [[Windows]] - Команды Windows
- [[WSL]] - Команды WSL
