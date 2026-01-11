# TheYvnAI

AI/LLM VPS сервер.

## Информация о сервере
- **IP:** 159.195.65.72
- **Порт:** 11011
- **Пользователь:** admin
- **SSH ключ:** ~/.ssh/theyvnai_key
- **Публичный URL:** https://ai.theyvn.net

## Сервисы
- **Ollama** - Self-hosted LLM runtime (порт 11434)
- **LiteLLM** - OpenAI-compatible API proxy (порт 4000)
- **PostgreSQL** - База данных для ключей и статистики
- **Redis** - Rate limiting и кеширование
- **Cloudflare Tunnel** - Безопасный публичный доступ

## Модели (12.5 GB)
- DeepSeek R1 1.5B - рассуждения
- Llama 3.2 3B - общего назначения
- Qwen 2.5 7B - продвинутая
- Qwen 2.5 Coder 7B - для кода

## Команды для TheYvnAI

```dataview
TABLE technology AS "Технология", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE system = "TheYvnAI"
SORT file.name ASC
```

## Быстрый доступ
```bash
# SSH подключение
ssh admin@159.195.65.72 -p 11011

# Монтирование через rclone (из WSL)
cd ~/my-servers && ./mount-vps.sh

# Управление сервисом
systemctl --user status ai-server
```

## Связанные
- [[Systems/VPS/VPS|🌐 Все VPS серверы]]
- [[The Yvn Hub/TheYvnHub|🌐 TheYvnHub]] - Инфраструктурный сервер
- [[Technologies/ssh|🔑 ssh]] - Команды SSH
- [[Technologies/rclone|🔐 rclone]] - Команды монтирования
- [[Technologies/podman|📦 podman]] - Управление контейнерами
