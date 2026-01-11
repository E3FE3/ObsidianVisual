---
system: WINDOWS
technology: rclone
tags: [mount, vps, theyvnhub]
created: 2026-01-10
description: Монтирование TheYvnHub VPS как диска V: в Windows
---

# Mount TheYvnHub

## Описание
Монтирование VPS сервера TheYvnHub как локального диска V: в Windows используя rclone. Обеспечивает прямой доступ к файлам на удалённом сервере.

## Команда
```powershell
rclone mount TheYvnHub:/ V: --vfs-cache-mode full --volname "TheYvnHub"
```

## Примеры использования

**Монтирование в foreground (видны логи)**
```powershell
rclone mount theyvnhub: V: --vfs-cache-mode full --volname "TheYvnHub" -v
```

**Монтирование в background**
```powershell
Start-Process rclone -ArgumentList "mount","theyvnhub:","V:","--vfs-cache-mode","full","--volname","TheYvnHub" -WindowStyle Hidden
```

**Размонтирование**
```powershell
taskkill /IM rclone.exe /F
```

## Заметки
- Требуется установленный rclone в Windows
- SSH ключ ~/.ssh/theyvnhub_key должен быть настроен
- Буква диска V: должна быть доступна
- Используйте Ctrl+C для размонтирования при работе в foreground

## Связанные
- [[TheYvnHub]] - Информация о сервере
- [[rclone]] - Документация rclone
- [[SSH TheYvnHub]] - SSH подключение
