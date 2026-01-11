# podman

Движок контейнеров без демона.

## Описание
Podman - движок контейнеров без демона для разработки, управления и запуска OCI Containers. Это drop-in замена для Docker с поддержкой rootless контейнеров. В отличие от Docker, Podman нативно поддерживает концепцию **Pods** (подов), заимствованную из Kubernetes.

## Концепция Pods
**Pod** - это группа из одного или нескольких контейнеров, разделяющих общие сетевые ресурсы и хранилище. Это позволяет объединять связанные сервисы (например, веб-сервер и базу данных) в единую управляемую сущность.

### Основные команды для Pods
- `podman pod create` - Создать новый под
- `podman pod ls` - Список всех подов
- `podman pod ps` - Контейнеры внутри подов
- `podman pod start/stop/restart` - Управление состоянием пода
- `podman pod rm` - Удаление пода
- `podman run --pod name` - Запуск контейнера в существующем поде

## Официальная документация
- [podman.io](https://podman.io/)
- [Podman Pods Guide](https://docs.podman.io/en/latest/markdown/podman-pod.1.html)
- [Команды Podman](https://docs.podman.io/en/latest/Commands.html)

## Команды использующие podman

```dataview
TABLE system AS "Система", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE technology = "podman"
SORT system ASC, file.name ASC
```

## Частые сценарии использования
- **Запуск связанных сервисов в Pods** (AI сервисы + API прокси)
- Управление контейнерами без root прав
- Запуск системных сервисов через systemd
- Сборка образов контейнеров
- Локальная разработка Kubernetes-совместимых приложений

## Скрипты управления
- [[manage-podman-pods]] - Скрипт для автоматизации работы с подами на TheYvnHub

## Связанные
- [[TheYvnHub]] - Hub сервер (использует Podman)
- [[TheYvnAI]] - AI сервер (использует Podman)
- [[VPS]] - VPS серверы
