---
system: TheYvnAI
technology: database
tags: [database, postgresql, redis, sql]
created: 2026-01-10
description: Управление базами данных PostgreSQL и Redis
---

# Database

## Описание
Раздел посвящен управлению базами данных в инфраструктуре. В основном используется на сервере TheYvnAI для работы LiteLLM и других AI-сервисов.

## СУБД в использовании
- **PostgreSQL**: Основная реляционная база данных.
- **Redis**: Хранилище сессий, кеширование и ограничение частоты запросов (Rate Limiting).

## Команды управления

```dataview
TABLE system AS "Система", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE technology = "database"
SORT system ASC, file.name ASC
```

## Основные операции
- [[Snippets/Check Database Status|📊 Проверка статуса]]
- [[Technologies/backup|💾 Бэкап и восстановление]]

## Связанные
- [[Systems/VPS/The Yvn AI/TheYvnAI|🌐 TheYvnAI]]
- [[Technologies/litellm|🔗 LiteLLM]]
- [[Technologies/backup|💾 Backup]]
