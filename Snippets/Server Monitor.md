---
system: WSL
technology: monitoring
tags: [monitoring, dashboard, real-time, status]
created: 2026-01-10
description: Скрипт мониторинга всех серверов в реальном времени
---

# Server Monitor

## Описание
Интерактивный Dashboard в терминале для отслеживания состояния всех серверов (CPU, RAM, Disk, Services, Ports).

## Команда
```bash
./Scripts/server-monitor.sh [refresh_interval]
```

## Примеры использования
- `./Scripts/server-monitor.sh` - Запуск с интервалом 5 секунд
- `./Scripts/server-monitor.sh 2` - Частое обновление (2 сек)

## Примечания
- Цветовая индикация критических значений (RAM > 80%, Disk > 90%)
- Проверяет доступность портов (80, 443, 4000, 11434)
- Проверяет статус сервисов (Nginx, Ollama, LiteLLM, DBs)

## Связанные
- [[_Dashboard/Home|🏠 На главную]]
- [[Snippets/Check System Performance|📊 Check System Performance]]
- [[Snippets/Check Disk Space|💾 Check Disk Space]]
