---
system: WSL
technology: ssh
tags: [ssh, vps, theyvnhub, wsl]
created: 2026-01-10
description: SSH подключение к TheYvnHub из WSL
---

# SSH TheYvnHub from WSL

## Описание
Подключение к VPS серверу TheYvnHub через SSH из WSL Ubuntu.

## Команда
```bash
ssh grem@80.71.224.134
```

## Примеры использования
```bash
# Базовое подключение (использует SSH config)
ssh theyvnhub

# Прямое подключение
ssh grem@80.71.224.134

# С указанным ключом
ssh -i ~/.ssh/theyvnhub_key grem@80.71.224.134

# Выполнить команду и выйти
ssh theyvnhub "podman ps -a"

# Копирование файла на сервер
scp local-file.txt theyvnhub:~/remote-path/
```

## Заметки
- Расположение SSH config: ~/.ssh/config
- SSH ключ: ~/.ssh/theyvnhub_key
- Alias в конфиге: `theyvnhub` (короткая команда для полной строки подключения)
- Порт 22 (по умолчанию)

## Связанные
- [[TheYvnHub]] - Информация о сервере
- [[ssh]] - Документация SSH
- [[SSH TheYvnAI from WSL]] - Подключение к AI серверу
