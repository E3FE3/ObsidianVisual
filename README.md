# LAUNCHER - Хранилище команд инфраструктуры

Централизованный репозиторий команд и скриптов для управления инфраструктурой с профессиональным dashboard в стиле **Apple Music Desktop**.

## Дизайн система

### Стиль
- **Apple Music Desktop** - минималистичный, профессиональный дизайн
- **Dark Theme** - тёмная тема с высокой контрастностью
- **Fire Orange Accent** (#E85D3D) - тёплый огненно-оранжевый акцент
- **SVG Icons** - профессиональные векторные иконки Lucide

### CSS Архитектура
Модульная система из 15 CSS файлов:
- `00-reset.css` - сброс стилей Obsidian, переопределение фиолетовых цветов
- `00-ui-controls.css` - стили для переключателей, inputs, buttons
- `00-animations.css` - плавные анимации и transitions
- `01-variables.css` - design tokens (цвета, spacing, typography)
- `02-tables.css` - стилизация таблиц в стиле Apple Music
- `03-links.css` - стили для ссылок с огненно-оранжевым hover
- `04-callouts.css` - красивые callout блоки
- `05-headings.css` - типографика заголовков
- `06-layout.css` - layout и spacing (max-width: 1600px)
- `06-list.css` - стили для списков
- `06-code.css` - code blocks styling
- `07-grid-system.css` - grid layout для карточек
- `08-cards.css` - карточки с subtle hover эффектами
- `09-svg-icons.css` - **векторные SVG иконки** (работает БЕЗ плагинов!)

### Цветовая палитра
```css
--launcher-accent: #E85D3D          /* Fire Orange - основной акцент */
--launcher-accent-hover: #FF6B4A    /* Hover состояние */
--launcher-bg-primary: #1A1A1A      /* Основной фон */
--launcher-bg-secondary: #252525    /* Вторичный фон */
--launcher-bg-card: #252525         /* Фон карточек */
--launcher-text: #FFFFFF            /* Основной текст */
--launcher-text-secondary: #B3B3B3  /* Вторичный текст */
```

## Структура Vault

```
LAUNCHER/
├── _Templates/          # Шаблоны для новых команд
├── _Dashboard/          # Главные навигационные страницы
│   ├── Home.md         # Главный dashboard с иконками
│   └── All Commands.md # Список всех команд
├── Systems/            # Команды по системам
│   ├── WINDOWS/       # Windows PC (PowerShell, CMD)
│   ├── WSL/           # WSL Ubuntu
│   └── VPS/           # VPS серверы
│       ├── The Yvn Hub/   # Инфраструктура (Plane, n8n)
│       └── The Yvn AI/    # AI/LLM (Ollama, LiteLLM)
├── Technologies/       # Команды по технологиям
│   ├── rclone.md      # Rclone команды
│   ├── ssh.md         # SSH команды
│   └── podman.md      # Podman команды
├── Scripts/           # Bash скрипты автоматизации
├── Snippets/          # Быстрые команды
└── .obsidian/
    └── snippets/      # Модульные CSS файлы
        ├── 00-reset.css
        ├── 01-variables.css
        ├── 02-tables.css
        ├── 08-cards.css
        ├── 09-svg-icons.css
        └── ...
```

## Быстрый старт

### 1. Установка плагинов
Settings → Community plugins:
- **Dataview** - динамические таблицы и списки команд (обязательно)
- **Templater** - автозаполнение шаблонов (опционально)

### 2. Включение CSS
Settings → Appearance → CSS snippets:
- Включите ВСЕ сниппеты (00-*, 01-*, 02-*, ..., 09-svg-icons)
- Порядок важен! Убедитесь что `01-variables.css` загружается первым

### 3. Открытие Dashboard
Откройте [[_Dashboard/Home|Home]] - главный dashboard с иконками

## Особенности

### Профессиональные SVG иконки
CSS автоматически добавляет векторные иконки Lucide:
- Ракета - LAUNCHER заголовок (огненно-оранжевая)
- Монитор - Windows
- Терминал - WSL
- Глобус - VPS серверы
- Облако - Rclone
- Ключ - SSH
- Пакет - Podman
- Книга - Документация
- Шестерёнка - Настройки

**Работает БЕЗ плагинов!** Чистый CSS через `09-svg-icons.css`

### Apple Music стиль
- Subtle hover эффекты (translateY -2px)
- Мягкие тени (0 4px 8px rgba(0,0,0,0.4))
- Закруглённые углы (border-radius: 10px)
- Плавные transitions (0.2s cubic-bezier)
- Generous spacing (padding: 1.5rem)
- Профессиональная типографика (SF Pro шрифты)

### Переключатели и контролы
- OFF состояние: видимый серый фон
- ON состояние: огненно-оранжевый
- Smooth transitions
- Правильные hover эффекты

### Таблицы
- Чистый дизайн без внешних границ
- Uppercase заголовки (letter-spacing: 0.05em)
- Огненно-оранжевые ссылки при hover
- Последняя строка без границы

## Навигация

- **Home** — Главный dashboard с карточками систем
- **All Commands** — Полный список команд с фильтрами
- **Windows** — Команды для Windows PC
- **WSL** — Команды для WSL Ubuntu
- **VPS** — Команды для VPS серверов
- **Rclone** — Монтирование облаков
- **SSH** — Удалённый доступ
- **Podman** — Управление контейнерами

## Добавление команд

### Используя шаблон
1. Создайте новую заметку из шаблона: [[_Templates/Command|Command]]
2. Заполните frontmatter:
   ```yaml
   ---
   system: WINDOWS        # WINDOWS | WSL | TheYvnHub | TheYvnAI
   technology: rclone     # rclone | ssh | podman | git
   tags: [mount, vps]     # релевантные теги
   created: 2026-01-11
   description: Краткое описание команды
   ---
   ```
3. Заполните секции контента
4. Сохраните в `Snippets/` или `Scripts/`

### Лучшие практики
1. **Одна команда на файл** - фокус на конкретной задаче
2. **Frontmatter обязателен** - для Dataview запросов
3. **Примеры использования** - покажите разные сценарии
4. **Связанные ссылки** - укажите похожие команды
5. **Тестируйте команды** - проверяйте перед сохранением

## Системы

### Windows
- **Расположение**: `Systems/WINDOWS/`
- **Команды**: PowerShell, CMD
- **Примеры**: rclone mount, Windows утилиты

### WSL (Ubuntu)
- **Расположение**: `Systems/WSL/`
- **Команды**: Bash, Linux tools
- **Примеры**: SSH, rclone, системные команды

### VPS - TheYvnHub (Инфраструктура)
- **IP**: 80.71.224.134:22
- **User**: grem
- **Сервисы**: Plane, n8n, Gitea
- **Расположение**: `Systems/VPS/The Yvn Hub/`

### VPS - TheYvnAI (AI/LLM)
- **IP**: 159.195.65.72:11011
- **User**: admin
- **Сервисы**: Ollama, LiteLLM, PostgreSQL, Redis
- **Public**: https://ai.theyvn.net
- **Расположение**: `Systems/VPS/The Yvn AI/`

## Технологии

### Rclone
Монтирование и синхронизация облачных хранилищ.
- **Команды**: mount, sync, copy
- **Расположение**: `Technologies/rclone.md`

### SSH
Безопасный удалённый доступ к серверам.
- **Команды**: подключение, туннели, копирование файлов
- **Расположение**: `Technologies/ssh.md`

### Podman
Управление контейнерами и подами.
- **Команды**: run, build, compose
- **Расположение**: `Technologies/podman.md`

## Соглашения по тегам

Используйте согласованные теги:
- **Системные**: `windows`, `wsl`, `vps`
- **Функциональные**: `mount`, `connection`, `backup`, `deploy`
- **Технологии**: `rclone`, `ssh`, `podman`, `git`, `docker`
- **Срочность**: `quick`, `important`, `troubleshooting`

## Поиск команд

### По системе
```dataview
TABLE description, technology
FROM "Snippets"
WHERE system = "WINDOWS"
SORT created DESC
```

### По технологии
```dataview
TABLE description, system
FROM "Snippets"
WHERE technology = "ssh"
SORT created DESC
```

### По тегу
```dataview
TABLE description, system, technology
FROM "Snippets"
WHERE contains(tags, "mount")
SORT created DESC
```

## Кастомизация

### Изменение акцентного цвета
Отредактируйте `.obsidian/snippets/01-variables.css`:
```css
--launcher-accent: #E85D3D;        /* Ваш цвет */
--launcher-accent-hover: #FF6B4A;  /* Hover вариант */
```

### Изменение ширины контента
Отредактируйте `.obsidian/snippets/06-layout.css`:
```css
.markdown-preview-view {
  max-width: 1600px !important;  /* Ваше значение */
}
```

### Добавление новых иконок
Отредактируйте `.obsidian/snippets/09-svg-icons.css`:
```css
.internal-link[href*="ВашСлово"]::before {
  background-image: url("data:image/svg+xml,...");
  /* SVG код иконки */
}
```

## Устранение проблем

### Иконки не отображаются
1. Проверьте что `09-svg-icons.css` включен в Settings → CSS snippets
2. Перезагрузите Obsidian (Ctrl+R)
3. Убедитесь что вы в **Reading View** (режим чтения)

### CSS не применяется
1. Проверьте порядок CSS сниппетов
2. `01-variables.css` должен быть загружен первым
3. Попробуйте отключить/включить все сниппеты
4. Проверьте что нет конфликтующих тем

### Фиолетовые цвета остались
1. Убедитесь что `00-reset.css` включен
2. Перезагрузите Obsidian полностью (закройте и откройте)
3. Проверьте что нет других включенных CSS снипп етов которые конфликтуют

## Дополнительные ресурсы

- [Документация Dataview](https://blacksmithgu.github.io/obsidian-dataview/)
- [Справка Obsidian](https://help.obsidian.md/)
- [Lucide Icons](https://lucide.dev/) - SVG иконки которые используются
- [Apple Music Design](https://www.apple.com/apple-music/) - референс дизайна

---

**Последнее обновление**: 2026-01-11
**Версия**: 3.0 (Apple Music Design System)
**CSS Modules**: 15 файлов
**Icons**: Lucide SVG (CSS-based, NO plugins)
