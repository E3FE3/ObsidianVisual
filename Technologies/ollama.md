---
system: TheYvnAI
technology: ollama
tags: [ollama, ai, models, llm]
created: 2026-01-10
description: Ollama - запуск и управление LLM моделями на TheYvnAI
---

# Ollama

## Описание
Ollama - платформа для запуска больших языковых моделей (LLM) локально на сервере TheYvnAI. Обеспечивает API для взаимодействия с моделями.

## Основные команды

### Управление сервисом
- [[Check Ollama Status]] - Проверка статуса сервиса
- [[Restart Ollama]] - Перезапуск сервиса

### Работа с моделями
- [[List Ollama Models]] - Список установленных моделей
- [[Pull Ollama Model]] - Загрузка новой модели
- [[Remove Ollama Model]] - Удаление модели
- [[Run Ollama Model]] - Запуск модели в интерактивном режиме

## Доступные модели

### Рекомендуемые
- `llama2` - Базовая модель 7B/13B/70B
- `codellama` - Для кода
- `mistral` - Быстрая и эффективная
- `neural-chat` - Для чатов

### Команда загрузки
```bash
ssh admin@159.195.65.72 -p 11011 'ollama pull llama2'
```

## API доступ

### Локальный API
```bash
curl http://localhost:11434/api/generate \
  -d '{
    "model": "llama2",
    "prompt": "Why is the sky blue?"
  }'
```

### Через LiteLLM прокси
```bash
curl http://159.195.65.72:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "ollama/llama2",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

## Конфигурация

### Файл конфигурации
```bash
ssh admin@159.195.65.72 -p 11011 'cat /etc/systemd/system/ollama.service'
```

### Переменные окружения
- `OLLAMA_HOST` - Хост для API (по умолчанию 0.0.0.0:11434)
- `OLLAMA_MODELS` - Путь к моделям (по умолчанию ~/.ollama/models)
- `OLLAMA_KEEP_ALIVE` - Время жизни модели в памяти

## Мониторинг

### Логи
```bash
ssh admin@159.195.65.72 -p 11011 'sudo journalctl -u ollama -f'
```

### Использование ресурсов
```bash
ssh admin@159.195.65.72 -p 11011 'ps aux | grep ollama'
ssh admin@159.195.65.72 -p 11011 'df -h ~/.ollama'
```

## Полезные ссылки
- [Официальный сайт Ollama](https://ollama.ai)
- [Библиотека моделей](https://ollama.ai/library)
- [Документация API](https://github.com/ollama/ollama/blob/main/docs/api.md)
