# :LiGlobe: VPS

Инфраструктура виртуальных частных серверов.

## Описание
Команды и конфигурации для управления удалёнными VPS серверами.

## Серверы
- [[The Yvn Hub/TheYvnHub|:LiGlobe: TheYvnHub]] - Инфраструктурный сервер (Plane, n8n, Gitea)
- [[The Yvn AI/TheYvnAI|:LiGlobe: TheYvnAI]] - AI сервер (Ollama, LiteLLM)

## Все команды VPS

```dataview
TABLE system AS "Сервер", technology AS "Технология", description AS "Описание", tags AS "Теги"
FROM "Snippets" OR "Scripts"
WHERE system = "TheYvnHub" OR system = "TheYvnAI"
SORT system ASC, file.name ASC
```

## Связанные
- [[_Dashboard/Home|:LiHome: На главную]]
- [[Systems/WINDOWS/Windows|:LiMonitor: Windows]]
- [[Systems/WSL/WSL|:LiTerminal: WSL]]
