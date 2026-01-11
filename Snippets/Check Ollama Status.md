---
system: TheYvnAI
technology: ollama
tags: [ollama, status, service, theyvnai]
created: 2026-01-10
description: Проверка статуса сервиса Ollama на TheYvnAI
---

# Check Ollama Status

## Описание
Проверка статуса работы сервиса Ollama на AI сервере TheYvnAI.

## Команда

```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl status ollama'
```

## Альтернативный вариант (краткий статус)

```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl is-active ollama'
```

## Проверка порта

```bash
ssh admin@159.195.65.72 -p 11011 'netstat -tlnp | grep :11434'
```

## Пример вывода

```
● ollama.service - Ollama Service
     Loaded: loaded (/etc/systemd/system/ollama.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2026-01-10 10:30:00 UTC; 2h ago
   Main PID: 1234 (ollama)
      Tasks: 7 (limit: 4661)
     Memory: 2.1G
        CPU: 15%
     CGroup: /system.slice/ollama.service
             └─1234 /usr/local/bin/ollama serve
```

## Примечания
- Ollama работает на порту 11434
- Для управления сервисом нужны права sudo
- Статус "active (running)" означает нормальную работу
