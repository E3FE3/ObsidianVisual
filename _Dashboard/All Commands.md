---
cssclasses: dashboard
---

<div align="center">

# 📚 Все команды
### Полный каталог команд инфраструктуры

[[_Dashboard/Home|🏠 Вернуться на главную]]

---

</div>

## 🔍 Фильтры

> [!example]+ Фильтр по системе
> - [[Systems/WINDOWS/Windows|🪟 WINDOWS]] - Команды для Windows PC
> - [[Systems/WSL/WSL|🐧 WSL]] - Команды для WSL Ubuntu
> - [[Systems/VPS/VPS|🌐 VPS]] - Команды для VPS серверов

> [!tip]+ Фильтр по технологии
> - [[Technologies/rclone|🔐 rclone]] - Монтирование и синхронизация
> - [[Technologies/ssh|🔑 ssh]] - Команды SSH подключения
> - [[Technologies/podman|📦 podman]] - Управление контейнерами

---

## 📋 Список команд

```dataview
TABLE WITHOUT ID
  ("⚡ " + file.link) AS "Команда",
  choice(system = "WINDOWS", "🪟 WINDOWS",
    choice(system = "WSL", "🐧 WSL",
      choice(system = "TheYvnHub", "🌐 TheYvnHub",
        choice(system = "TheYvnAI", "🌐 TheYvnAI", system)))) AS "Система",
  choice(technology = "rclone", "🔐 rclone",
    choice(technology = "ssh", "🔑 ssh",
      choice(technology = "podman", "📦 podman", technology))) AS "Технология",
  tags AS "🏷️ Теги",
  description AS "📝 Описание"
FROM "Snippets" OR "Scripts"
WHERE file.name != "Home" AND file.name != "All Commands"
SORT system ASC, file.name ASC
```

---

## 📊 Статистика по системам

```dataview
TABLE WITHOUT ID
  choice(system = "WINDOWS", "🪟 WINDOWS",
    choice(system = "WSL", "🐧 WSL",
      choice(system = "TheYvnHub", "🌐 TheYvnHub",
        choice(system = "TheYvnAI", "🌐 TheYvnAI", system)))) AS "Система",
  ("**" + length(rows) + "** команд") AS "Количество"
FROM "Snippets" OR "Scripts"
WHERE file.name != "Home" AND file.name != "All Commands"
GROUP BY system
SORT length(rows) DESC
```

---

## 🛠️ Статистика по технологиям

```dataview
TABLE WITHOUT ID
  choice(technology = "rclone", "🔐 rclone",
    choice(technology = "ssh", "🔑 ssh",
      choice(technology = "podman", "📦 podman", technology))) AS "Технология",
  ("**" + length(rows) + "** команд") AS "Количество"
FROM "Snippets" OR "Scripts"
WHERE file.name != "Home" AND file.name != "All Commands"
GROUP BY technology
SORT length(rows) DESC
```

---

<div align="center">

### 🎯 Быстрые действия

[[_Templates/Command|📝 Создать команду]] • [[_Dashboard/Home|🏠 На главную]] • [[README|📖 Документация]]

---

*Используйте Ctrl+F для поиска по странице*

</div>
