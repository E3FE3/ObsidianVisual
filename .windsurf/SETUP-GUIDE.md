# 🌊 Настройка Windsurf Cascade - Правильная инструкция

**Windsurf на Windows + Работа с WSL проектами**

---

## 📍 Структура файлов (ПРАВИЛЬНО)

### Global Rules (на Windows)
```
C:\Users\E3FE3\.codeium\windsurf\memories\global_rules.md
```
✅ Применяется ко **ВСЕМ** проектам
✅ Windsurf (Windows) читает отсюда

### Workspace Rules (в WSL проекте)
```
\\wsl$\Ubuntu\home\e3fe3\lab\obsidian\launcher\.windsurf\rules\
```
✅ Применяется **только к LAUNCHER**
✅ Windsurf читает когда открываешь WSL проект

### Workflows (в WSL проекте)
```
\\wsl$\Ubuntu\home\e3fe3\lab\obsidian\launcher\.windsurf\workflows\
```
✅ Автоматизация задач для этого проекта

---

## ✅ Что уже создано:

1. ✅ **Global rules** скопированы в Windows:
   - `C:\Users\E3FE3\.codeium\windsurf\memories\global_rules.md`

2. ✅ **Workspace rules** в WSL проекте:
   - `/home/e3fe3/lab/obsidian/launcher/.windsurf/rules/obsidian-launcher.md`

3. ✅ **Workflows** в WSL проекте:
   - `/css-improve` - улучшение CSS
   - `/new-command` - создание команды
   - `/sync-windows` - синхронизация
   - `/analyze` - анализ проекта

---

## 🚀 Как активировать (3 шага):

### Шаг 1: Открой WSL проект в Windsurf

В Windsurf:
```
File → Open Folder → \\wsl$\Ubuntu\home\e3fe3\lab\obsidian\launcher
```

Или можешь напрямую открыть через WSL:
```
File → Open Folder → введи путь: /home/e3fe3/lab/obsidian/launcher
```

### Шаг 2: Активируй Rules

1. Открой Cascade: `Ctrl+L`
2. Кликни **⚙️ Customizations** (справа вверху)
3. Вкладка **Rules**

**Добавь Global Rule:**
- Нажми **+ Global**
- Name: `WSL Environment Rules`
- Activation: **Always On**
- Путь к файлу: `C:\Users\E3FE3\.codeium\windsurf\memories\global_rules.md`
- Save

**Добавь Workspace Rule:**
- Нажми **+ Workspace**
- Name: `Obsidian LAUNCHER Rules`
- Activation: **Always On**
- Путь к файлу: `.windsurf/rules/obsidian-launcher.md` (автоматически найдёт в открытом проекте)
- Save

### Шаг 3: Добавь Workflows

В **Workflows** вкладке, добавь каждый:

| Trigger | Name | File |
|---------|------|------|
| `/css-improve` | CSS Dashboard Improvement | `.windsurf/workflows/css-improvement.md` |
| `/new-command` | Create New Command | `.windsurf/workflows/new-command.md` |
| `/sync-windows` | Sync to Windows | `.windsurf/workflows/sync-to-windows.md` |
| `/analyze` | Analyze Project | `.windsurf/workflows/analyze-project.md` |

---

## 🎯 Проверка

В Cascade напиши:
```
Какие rules активны?
```

Должен ответить что-то типа:
> У меня активны global rules для WSL окружения и workspace rules
> для Obsidian LAUNCHER проекта с информацией о системах и CSS правилах.

Попробуй workflow:
```
/analyze
```

Должен запуститься анализ проекта! 🎉

---

## 📂 Почему именно так:

### Windsurf на Windows читает:
- **Global rules** → `C:\Users\...\windsurf\memories\` (Windows path)
- **Workspace rules** → из открытого проекта (может быть WSL path)

### Когда открываешь WSL проект:
Windsurf видит файлы через WSL мост:
```
Windows Windsurf → WSL проект → читает .windsurf/rules/
```

### Схема:
```
┌─────────────────────────────────────┐
│  Windows: Windsurf установлен       │
│  C:\Program Files\Windsurf\         │
│                                     │
│  Global Rules:                      │
│  C:\Users\E3FE3\.codeium\...        │ ← для ВСЕХ проектов
└─────────────────────────────────────┘
                 ↓
         Открывает проект
                 ↓
┌─────────────────────────────────────┐
│  WSL: Проект LAUNCHER               │
│  /home/e3fe3/lab/obsidian/launcher/ │
│                                     │
│  Workspace Rules:                   │
│  .windsurf/rules/                   │ ← только для LAUNCHER
│                                     │
│  Workflows:                         │
│  .windsurf/workflows/               │ ← автоматизация
└─────────────────────────────────────┘
```

---

## 🎯 Примеры использования:

### С активированными Rules:

```
✅ Улучши CSS dashboard
   → Cascade знает структуру проекта, применит современные градиенты

✅ Создай команду для SSH к TheYvnHub
   → Cascade создаст файл с правильным frontmatter и IP адресом

✅ /analyze
   → Запустит workflow анализа проекта

✅ /css-improve
   → Автоматически улучшит CSS и синхронизирует с Windows Obsidian
```

### Без Rules (плохо):
```
❌ Создай файл .md в Snippets/ с frontmatter system: WINDOWS,
   technology: rclone, tags, created date, description на русском,
   добавь секции Описание, Команда, Примеры...
   [объяснение на 5 минут]
```

---

## 💡 Важные моменты:

1. **Global rules** один раз настраиваются в Windows - работают для всех проектов
2. **Workspace rules** в каждом WSL проекте свои
3. **Workflows** можно копировать между проектами
4. Windsurf отлично работает с WSL - видит файлы напрямую

---

## 📚 Документация проекта:

- `.windsurf/README.md` - полная документация
- `.windsurf/QUICKSTART.md` - быстрый старт
- `.windsurf/rules/obsidian-launcher.md` - workspace правила
- `.windsurf/workflows/` - все workflows

**Global rules**: `C:\Users\E3FE3\.codeium\windsurf\memories\global_rules.md`

---

## 🔥 Результат:

После настройки Cascade будет:
- ✅ Понимать что работаешь в WSL
- ✅ Знать структуру LAUNCHER проекта
- ✅ Создавать команды с правильным frontmatter
- ✅ Улучшать CSS в современном стиле
- ✅ Общаться на русском, кодить на английском
- ✅ Использовать `sudo service` вместо `systemctl`

**Эффективность работы вырастет в 10 раз!** 🚀

---

**Sources:**
- [Windsurf Documentation](https://docs.windsurf.com/)
- [Cascade Memories](https://docs.windsurf.com/windsurf/cascade/memories)
- [Windsurf Rules Directory](https://windsurf.com/editor/directory)
