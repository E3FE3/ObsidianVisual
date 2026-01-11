---
system: TheYvnAI
technology: litellm
tags: [litellm, status, api, proxy, theyvnai]
created: 2026-01-10
description: Проверка статуса LiteLLM прокси на TheYvnAI
---

# Check LiteLLM Status

## Описание
Проверка статуса работы LiteLLM прокси-сервера, который обеспечивает унифицированный API для доступа к различным LLM моделям.

## Проверка сервиса

```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl status litellm'
```

## Проверка порта API

```bash
ssh admin@159.195.65.72 -p 11011 'netstat -tlnp | grep :4000'
```

## Тест API эндпоинта

```bash
ssh admin@159.195.65.72 -p 11011 'curl -s http://localhost:4000/health | jq'
```

## Проверка логов

```bash
ssh admin@159.195.65.72 -p 11011 'sudo journalctl -u litellm -n 50 --no-pager'
```

## Пример вывода здоровья API

```json
{
  "status": "healthy",
  "models": [
    "ollama/llama2",
    "ollama/mistral",
    "ollama/codellama"
  ],
  "version": "1.0.0"
}
```

## Проверка конфигурации

```bash
ssh admin@159.195.65.72 -p 11011 'cat /opt/litellm/config.yaml'
```

## Перезапуск сервиса

```bash
ssh admin@159.195.65.72 -p 11011 'sudo systemctl restart litellm'
```

## Примечания
- LiteLLM работает на порту 4000
- Проксирует запросы к Ollama моделям
- Публичный доступ через https://ai.theyvn.net
- Для управления сервисом нужны права sudo
