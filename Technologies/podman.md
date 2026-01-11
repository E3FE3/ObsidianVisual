# podman

Движок контейнеров без демона.

## Описание
Podman - движок контейнеров без демона для разработки, управления и запуска OCI Containers. Это drop-in замена для Docker с поддержкой rootless контейнеров.

## Официальная документация
- [podman.io](https://podman.io/)
- [Команды Podman](https://docs.podman.io/en/latest/Commands.html)

## Команды использующие podman

```dataview
TABLE system AS "Система", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE technology = "podman"
SORT system ASC, file.name ASC
```

## Частые сценарии использования
- Запуск контейнеров (AI сервисы, базы данных и т.д.)
- Сборка образов контейнеров
- Управление подами
- Выполнение rootless контейнеров

## Связанные
- [[TheYvnHub]] - Hub сервер (использует Podman)
- [[TheYvnAI]] - AI сервер (использует Podman)
- [[VPS]] - VPS серверы
