---
system: TheYvnHub
technology: podman
tags: [podman, pods, containers, management]
created: 2026-01-10
description: Скрипт управления Podman подами и контейнерами на TheYvnHub
---

# Manage Podman Pods

## Описание
Скрипт для удобного управления группами контейнеров (подами) на сервере TheYvnHub через SSH.

## Команда
```bash
./Scripts/manage-podman-pods.sh [command] [pod_name]
```

## Примеры использования
- `./Scripts/manage-podman-pods.sh list` - Список всех подов
- `./Scripts/manage-podman-pods.sh restart ai-pod` - Перезапуск конкретного пода
- `./Scripts/manage-podman-pods.sh logs web-pod` - Просмотр логов пода

## Примечания
- Позволяет управлять контейнерами как единым целым
- Поддерживает команды: ls, ps, start, stop, restart, logs, inspect, prune

## Связанные
- [[_Dashboard/Home|🏠 На главную]]
- [[Technologies/podman|📦 Технология: Podman]]
- [[Snippets/List Podman Containers|📋 List Podman Containers]]
