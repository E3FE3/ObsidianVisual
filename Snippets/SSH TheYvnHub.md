---
system: WINDOWS
technology: ssh
tags: [ssh, vps, theyvnhub, connection]
created: 2026-01-10
description: SSH подключение к TheYvnHub из Windows
---

# SSH TheYvnHub

## Описание
Подключение к VPS серверу TheYvnHub через SSH из Windows.

## Команда
```powershell
ssh grem@80.71.224.134
```

## Примеры использования

**Базовое подключение**
```powershell
ssh grem@80.71.224.134
```

**С указанным ключом**
```powershell
ssh -i ~/.ssh/theyvnhub_key grem@80.71.224.134
```

**Выполнение одной команды**
```powershell
ssh grem@80.71.224.134 "podman ps -a"
```

**Проброс портов**
```powershell
ssh -L 8080:localhost:8080 grem@80.71.224.134
```

## Заметки
- Порт по умолчанию: 22
- Пользователь: grem
- SSH ключ: ~/.ssh/theyvnhub_key
- При первом подключении попросит подтвердить fingerprint

## Связанные
- [[TheYvnHub]] - Информация о сервере
- [[ssh]] - Документация SSH
- [[Mount TheYvnHub]] - Монтирование как диск
