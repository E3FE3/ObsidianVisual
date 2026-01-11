---
cssclasses: dashboard
---

<div align="center">

# 📚 Все команды
### Полный каталог команд инфраструктуры

[[Home|← Вернуться на главную]]

---

</div>

## 🔍 Фильтры

> [!example]+ Фильтр по системе
> - [[Windows|🪟 WINDOWS]] - Команды для Windows PC
> - [[WSL|🐧 WSL]] - Команды для WSL Ubuntu
> - [[VPS|🌐 VPS]] - Команды для VPS серверов

> [!tip]+ Фильтр по технологии
> - [[rclone|🔐 rclone]] - Монтирование и синхронизация
> - [[ssh|🔑 ssh]] - SSH подключения
> - [[podman|📦 podman]] - Управление контейнерами

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

[[Command|📝 Создать команду]] • [[Home|🏠 На главную]] • [[README|📖 Документация]]

---

*Используйте Ctrl+F для поиска по странице*

</div>
