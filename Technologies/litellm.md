---
system: TheYvnAI
technology: litellm
tags: [litellm, proxy, api, ai]
created: 2026-01-10
description: LiteLLM - унифицированный API прокси для LLM моделей
---

# LiteLLM

## Описание
LiteLLM - прокси-сервер, предоставляющий унифицированный OpenAI-совместимый API для доступа к различным LLM моделям, включая Ollama.

## Основные команды

### Управление сервисом
- [[Check LiteLLM Status]] - Проверка статуса сервиса
- [[Restart LiteLLM]] - Перезапуск сервиса
- [[View LiteLLM Logs]] - Просмотр логов

### Конфигурация
- [[Edit LiteLLM Config]] - Редактирование конфигурации
- [[Reload LiteLLM Config]] - Перезагрузка конфигурации

## API доступ

### Публичный эндпоинт
```
https://ai.theyvn.net
```

### Локальный эндпоинт
```
http://159.195.65.72:4000
```

### Пример запроса
```bash
curl https://ai.theyvn.net/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-api-key" \
  -d '{
    "model": "ollama/llama2",
    "messages": [{"role": "user", "content": "Hello!"}],
    "temperature": 0.7
  }'
```

## Поддерживаемые модели

### Ollama модели
- `ollama/llama2`
- `ollama/mistral`
- `ollama/codellama`
- `ollama/neural-chat`

### Формат именования
```
ollama/{model-name}
```

## Конфигурация

### Основной конфигурационный файл
```bash
ssh admin@159.195.65.72 -p 11011 'cat /opt/litellm/config.yaml'
```

### Пример конфигурации
```yaml
model_list:
  - model_name: llama2
    litellm_params:
      model: "ollama/llama2"
      api_base: "http://localhost:11434"
  - model_name: mistral
    litellm_params:
      model: "ollama/mistral"
      api_base: "http://localhost:11434"

litellm_settings:
  drop_params: true
  success_callback: ["langfuse"]
  
general_settings:
  master_key: sk-1234
  database_url: "postgresql://user:pass@localhost/litellm"
```

## Мониторинг

### Проверка здоровья
```bash
curl https://ai.theyvn.net/health
```

### Метрики
```bash
curl https://ai.theyvn.net/metrics
```

### Логи
```bash
ssh admin@159.195.65.72 -p 11011 'sudo journalctl -u litellm -n 100'
```

## Интеграция

### Python
```python
from openai import OpenAI

client = OpenAI(
    api_key="your-api-key",
    base_url="https://ai.theyvn.net"
)

response = client.chat.completions.create(
    model="ollama/llama2",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

### JavaScript
```javascript
import OpenAI from 'openai';

const openai = new OpenAI({
  apiKey: 'your-api-key',
  baseURL: 'https://ai.theyvn.net'
});

const response = await openai.chat.completions.create({
  model: 'ollama/llama2',
  messages: [{ role: 'user', content: 'Hello!' }],
});
```

## Безопасность

### API ключи
- Создаются через конфигурацию
- Могут быть ограничены по моделям
- Поддерживается ротация ключей

### Rate limiting
```yaml
router_settings:
  user_specific_rate_limits:
    - user_id: "user123"
      tpm: 1000
      rpm: 10
```

## Полезные ссылки
- [Документация LiteLLM](https://docs.litellm.ai/)
- [GitHub репозиторий](https://github.com/BerriAI/litellm)
- [Примеры конфигураций](https://docs.litellm.ai/docs/config)
