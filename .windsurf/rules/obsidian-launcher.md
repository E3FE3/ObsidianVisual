# Проект Obsidian LAUNCHER - Workspace правила

## Контекст проекта
<project_info>
- **Тип**: Obsidian vault для управления командами инфраструктуры
- **Название**: LAUNCHER
- **Назначение**: Централизованный репозиторий команд и скриптов для управления инфраструктурой (WINDOWS, WSL, VPS серверы)
- **Основной пользователь**: Русскоязычный системный администратор
- **Ключевые технологии**: Obsidian, плагин Dataview, Custom CSS, rclone, SSH
</project_info>

## Правила по языку
<language_rules>
- **UI/Документация**: Русский язык для всего пользовательского контента
- **Код/Комментарии**: Английский язык для всех комментариев в коде и технических терминов
- **Названия систем**: Оставлять на английском (WINDOWS, WSL, TheYvnHub, TheYvnAI)
- **Технические термины**: Оставлять непереведёнными (SSH, rclone, mount, git, и т.д.)
- **Названия файлов**: Английский для консистентности
</language_rules>

## Правила структуры файлов
<structure_rules>
- **Файлы Dashboard**: Расположены в папке `_Dashboard/`
  - `Home.md` - Главный dashboard с CSS классами
  - `All Commands.md` - Полный список команд
- **Шаблоны**: Расположены в папке `_Templates/`
- **Команды**: Сохранять в `Snippets/` (простые) или `Scripts/` (сложные)
- **Организация по системам**: `Systems/WINDOWS/`, `Systems/WSL/`, `Systems/VPS/`
- **Организация по технологиям**: `Technologies/rclone/`, `Technologies/ssh/`, и т.д.
</structure_rules>

## Правила CSS стилизации
<css_rules>
- **Основной CSS файл**: `.obsidian/snippets/dashboard.css`
- **Подход**: Современный, профессиональный дизайн в стиле веб-приложений
- **Обязательные элементы**:
  - Gradient headers с glow эффектами
  - Card-based layout с цветными границами (success=зелёный, info=синий, warning=оранжевый)
  - Grid система: 3 колонки desktop, 2 tablet, 1 mobile
  - Hover эффекты с scale и shadows
  - Плавные анимации и transitions
- **Цветовая палитра**:
  - Primary: #6366f1 (indigo)
  - Secondary: #8b5cf6 (purple)
  - Accent: #ec4899 (pink)
  - Success: #10b981, Info: #3b82f6, Warning: #f59e0b, Danger: #ef4444
- **CSS переменные**: Используй custom properties для консистентности
- **Классы компонентов**: .card, .btn-primary, .btn-outline, .badge, .dashboard-grid
</css_rules>

## Требования к Obsidian Frontmatter
<frontmatter_rules>
Все файлы команд ДОЛЖНЫ включать:
```yaml
---
system: WINDOWS | WSL | TheYvnHub | TheYvnAI
technology: rclone | ssh | podman | git | и т.д.
tags: [релевантные, теги, здесь]
created: YYYY-MM-DD
description: Краткое описание в одну строку на русском
---
```
</frontmatter_rules>

## Интеграция Dataview
<dataview_rules>
- **Плагин**: Dataview должен быть включён с JavaScript queries
- **Использование**: Динамические таблицы и списки в dashboard файлах
- **Частые запросы**:
  - Недавние команды: `SORT created DESC LIMIT 10`
  - По системе: `WHERE system = "WINDOWS"`
  - По технологии: `WHERE technology = "rclone"`
  - Статистика: `GROUP BY system`
</dataview_rules>

## Стандарты качества кода
<code_standards>
- **CSS**:
  - Использовать BEM-подобные naming conventions
  - Организовывать по секциям (Colors, Layout, Components, Responsive)
  - Современные CSS фичи (grid, flexbox, custom properties)
  - Mobile-first responsive дизайн
- **Markdown**:
  - Использовать HTML divs с CSS классами для стилизованных компонентов
  - Оставлять markdown для простого контента
  - Использовать code blocks с language syntax highlighting
- **Скрипты**:
  - Bash скрипты: Включать shebang, error handling, комментарии
  - PowerShell: Использовать approved verbs, правильный error handling
</code_standards>

## Правила для конкретных систем
<system_guidelines>
### WINDOWS
- Команды выполняются в PowerShell или CMD
- Используй Windows-style пути когда необходимо
- Документируй любые требования к правам администратора

### WSL
- Ubuntu-based Linux окружение
- Используй `sudo service` (не systemctl) для сервисов
- Все файловые операции в Linux путях

### VPS серверы
**TheYvnHub** (Инфраструктура):
- IP: 80.71.224.134:22
- Пользователь: grem
- Сервисы: Plane, n8n, Gitea
- SSH ключ: ~/.ssh/theyvnhub_key

**TheYvnAI** (AI/LLM):
- IP: 159.195.65.72:11011
- Пользователь: admin
- Сервисы: Ollama, LiteLLM, PostgreSQL, Redis
- Публичный: https://ai.theyvn.net
- SSH ключ: ~/.ssh/theyvnai_key
</system_guidelines>

## Best practices
<best_practices>
1. **Одна команда на файл**: Держи snippets сфокусированными и одноцелевыми
2. **Всегда включай примеры**: Показывай разные сценарии использования
3. **Связывай родственные команды**: Используй Obsidian ссылки [[Название команды]]
4. **Тестируй перед сохранением**: Проверяй что команды работают перед документированием
5. **Обновляй описания**: Держи их краткими и ясными
6. **Визуальная консистентность**: Следуй установленным CSS паттернам
7. **Responsive дизайн**: Тестируй на разных размерах экрана
8. **Доступность**: Поддерживай правильные контрастные соотношения и focus states
</best_practices>

## При внесении изменений
<change_guidelines>
- **Обновления CSS**: Всегда обновляй оба файла:
  - `.obsidian/snippets/dashboard.css` (WSL проект)
  - `/mnt/c/Users/E3FE3/Folder_F/Projects/Obsidian/Vaults/LAUNCHER/.obsidian/snippets/dashboard.css` (Windows)
- **Новые команды**: Используй шаблон из `_Templates/Command.md`
- **Изменения Dashboard**: Поддерживай существующую структуру и CSS классы
- **Тестирование**: Проверяй в обоих режимах Reading и Edit в Obsidian
</change_guidelines>
