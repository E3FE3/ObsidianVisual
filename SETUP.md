# :LiPalette: Настройка LAUNCHER Dashboard

## :LiZap: Быстрая настройка (4 шага)

### Шаг 1: Установите тему Minimal
1. **Settings** (`Ctrl+,`) → **Appearance** → **Themes** → **Manage**
2. Найдите **Minimal** и установите
3. Выберите **Minimal** как активную тему

### Шаг 2: Включите CSS snippet
1. **Settings** → **Appearance** → **CSS snippets**
2. Нажмите иконку папки чтобы открыть папку snippets
3. Убедитесь что файл `minimal-launcher.css` присутствует
4. Включите переключатель **minimal-launcher**
5. **Перезагрузите** (`Ctrl+R`)

### Шаг 3: Установите Dataview
1. **Settings** → **Community plugins** → **Browse**
2. Найдите и установите **Dataview**
3. Включите плагин

### Шаг 4: Откройте Dashboard
Откройте `_Dashboard/Home.md` в **Reading Mode** (`Ctrl+E`)

---

## :LiSparkles: Что вы получите

### :LiTarget: Возможности
- **Карточки из таблиц** — Markdown таблицы превращаются в grid карточки
- **Hover эффекты** — карточки поднимаются при наведении
- **Полная ширина** — контент занимает весь экран
- **Стилизованные Dataview** — таблицы с закругленными углами
- **Uppercase секции** — заголовки в стиле Linear/Vercel

### :LiPalette: Как это работает

Dashboard использует `cssclasses` в frontmatter:

```yaml
---
cssclasses:
  - cards
  - cards-cols-3
  - cards-align-bottom
  - table-max
---
```

Markdown таблицы автоматически превращаются в карточки:

```markdown
| Name | Description |
|------|-------------|
| [[link|:LiMonitor: Windows]] | Описание системы |
```

### :LiSmartphone: Адаптивный дизайн

Grid автоматически адаптируется под ширину экрана:
- `minmax(180px, 1fr)` — минимум 180px на карточку

---

## :LiPalette: Кастомизация

### Изменить размер карточек

Откройте `.obsidian/snippets/minimal-launcher.css`:

```css
/* Минимальная ширина карточки */
grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
```

### Изменить радиус скругления

```css
border-radius: 8px; /* Измените на 4px или 12px */
```

### Изменить hover эффект

```css
.cards table:not(.dataview) tr:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}
```

---

## :LiRocket: Дополнительные плагины

### Homepage (рекомендуется)
Автоматически открывает Home при запуске:
1. Установите **Homepage** plugin
2. Settings → Homepage → `_Dashboard/Home.md`

### Minimal Theme Settings
Дополнительная кастомизация Minimal:
1. Установите **Minimal Theme Settings** plugin
2. Настройте цвета, шрифты, отступы

---

## :LiBug: Решение проблем

### CSS стили не применяются
- ✅ Проверьте что **Minimal Theme** установлена и активна
- ✅ Проверьте что snippet **minimal-launcher** включен
- ✅ **Перезагрузите** Obsidian (`Ctrl+R`)
- ✅ Проверьте frontmatter: `cssclasses: cards`

### Карточки не отображаются как grid
- ✅ Убедитесь что используете **Reading Mode** (`Ctrl+E`)
- ✅ Проверьте структуру таблицы (должна быть с заголовками)

### Dataview таблицы пустые
- ✅ Включите плагин **Dataview**
- ✅ Проверьте что команды в папках `Snippets/` или `Scripts/`

### Карточки обрезаются сверху
- ✅ Обновите `minimal-launcher.css` до последней версии
- ✅ CSS должен содержать `overflow: visible`

---

## :LiLibrary: Структура CSS

```
minimal-launcher.css
├── HIDE UNWANTED ELEMENTS  # Скрытие metadata, inline-title
├── PAGE LAYOUT             # Полная ширина, overflow
├── TITLE                   # Стили H1
├── SECTION HEADERS         # Uppercase H2
├── TABLES AS CARDS         # Grid из таблиц
├── LINKS IN CARDS          # Стили ссылок
├── DATAVIEW TABLES         # Стилизация Dataview
└── HORIZONTAL RULES        # Разделители
```

---

## :LiPartyPopper: Готово!

**Что дальше?**
- :LiFileEdit: Создавайте команды: [[_Templates/Command|Command]]
- :LiLibrary: Все команды: [[_Dashboard/All Commands|All Commands]]
- :LiHome: Dashboard: [[_Dashboard/Home|Home]]
