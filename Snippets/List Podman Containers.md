---
system: TheYvnHub
technology: podman
tags: [podman, containers, management]
created: 2026-01-10
description: Список всех Podman контейнеров на TheYvnHub
---

# List Podman Containers

## Описание
Отображение всех Podman контейнеров (работающих и остановленных) на сервере TheYvnHub.

## Команда
```bash
podman ps -a
```

## Примеры использования

**Список всех контейнеров**
```bash
podman ps -a
```

**Список только работающих контейнеров**
```bash
podman ps
```

**Список с кастомным форматом**
```bash
podman ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

**Список с информацией о размере**
```bash
podman ps -a -s
```

**Фильтр по статусу**
```bash
podman ps -a --filter "status=running"
```

## Заметки
- Выполняйте эту команду на сервере TheYvnHub (после SSH)
- Флаг `-a` показывает все контейнеры (включая остановленные)
- Используйте `podman inspect <name>` для детальной информации
- Сервисы на TheYvnHub: Plane, n8n, Gitea

## Связанные
- [[TheYvnHub]] - Информация о сервере
- [[podman]] - Документация Podman
- [[SSH TheYvnHub]] - Подключение к серверу
