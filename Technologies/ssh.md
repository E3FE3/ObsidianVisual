# ssh

Протокол Secure Shell для удалённых подключений.

## Описание
SSH (Secure Shell) - криптографический сетевой протокол для безопасной работы сетевых сервисов в незащищённой сети. Используется для доступа к удалённым серверам и безопасной передачи файлов.

## Официальная документация
- [OpenSSH Руководство](https://www.openssh.com/manual.html)
- [SSH Config Гид](https://www.ssh.com/academy/ssh/config)

## Команды использующие ssh

```dataview
TABLE system AS "Система", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE technology = "ssh"
SORT system ASC, file.name ASC
```

## Частые сценарии использования
- Подключение к удалённым серверам
- Выполнение команд удалённо
- Безопасная передача файлов (SFTP)
- Проброс портов/туннелирование

## Связанные
- [[TheYvnHub]] - Hub сервер
- [[TheYvnAI]] - AI сервер
- [[VPS]] - VPS серверы
