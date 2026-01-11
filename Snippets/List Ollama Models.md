---
system: TheYvnAI
technology: ollama
tags: [ollama, models, list, theyvnai]
created: 2026-01-10
description: Список всех доступных моделей в Ollama на TheYvnAI
---

# List Ollama Models

## Описание
Отображение всех установленных моделей Ollama на AI сервере TheYvnAI с информацией о их размере и статусе.

## Команда

```bash
ssh admin@159.195.65.72 -p 11011 'ollama list'
```

## Подробная информация

```bash
ssh admin@159.195.65.72 -p 11011 'ollama list --verbose'
```

## Пример вывода

```
NAME                    ID           SIZE   MODIFIED
llama2:7b               78e26419b446 3.8 GB 2 days ago
codellama:7b            8b2c7a9c3d5e 3.8 GB 1 week ago
mistral:7b              61e88e884f7f 4.1 GB 3 days ago
neural-chat:7b          902b56d7b9a2 3.8 GB 5 hours ago
```

## Проверка запущенных моделей

```bash
ssh admin@159.195.65.72 -p 11011 'ollama ps'
```

## Скачать новую модель

```bash
ssh admin@159.195.65.72 -p 11011 'ollama pull llama2:13b'
```

## Удалить модель

```bash
ssh admin@159.195.65.72 -p 11011 'ollama rm llama2:7b'
```

## Примечания
- Команды выполняются на сервере через SSH
- Размер моделей указан в гигабайтах
- Для скачивания/удаления моделей нужно достаточно места на диске
