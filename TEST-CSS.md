---
cssclasses:
  - cards
  - cards-cols-3
---

<style>
/* EXPERIMENT: Fix underline only for text, not icons */
.internal-link {
  position: relative !important;
  text-decoration: none !important;
  display: inline-flex !important;
  align-items: center !important;
  gap: 0.5em !important;
  padding-left: 1.7em !important; /* Space for icon */
}

.internal-link:hover {
  text-decoration: none !important;
  border-bottom: none !important; /* Override old underline */
  text-shadow: 
    0 1px 0 var(--interactive-accent), /* Underline only */
    0 0 0 transparent; /* Reset other shadows */
}

/* Icon positioning - move outside text area */
.internal-link::before {
  position: absolute !important;
  left: 0 !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  margin-right: 0 !important;
}
</style>

# 🧪 CSS PLAYGROUND - LAUNCHER v3.0

**Файл для тестирования и экспериментов с дизайн-системой Apple Music.**

> **ДЛЯ WINDSURF CASCADE:** Экспериментируй ТОЛЬКО в этом файле! Когда пользователь одобрит изменения, только тогда применяй их в реальные CSS файлы.

---

## 🎨 Цветовая палитра

Тестирование всех цветов дизайн-системы.

### Основные цвета

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; margin: 2rem 0;">
  <div style="background: #E85D3D; padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600;">
    Fire Orange<br>#E85D3D
  </div>
  <div style="background: #FF6B4A; padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600;">
    Accent Hover<br>#FF6B4A
  </div>
  <div style="background: #1A1A1A; padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600; border: 1px solid #333;">
    BG Primary<br>#1A1A1A
  </div>
</div>

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; margin: 2rem 0;">
  <div style="background: #252525; padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600;">
    BG Secondary<br>#252525
  </div>
  <div style="background: #2A2A2A; padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600;">
    BG Elevated<br>#2A2A2A
  </div>
  <div style="background: rgba(255,255,255,0.03); padding: 2rem; border-radius: 10px; text-align: center; font-weight: 600; border: 1px solid #333;">
    BG Hover<br>rgba(255,255,255,0.03)
  </div>
</div>

---

## 📝 Типографика

### Заголовки всех уровней

# H1 - Заголовок первого уровня (с иконкой ракеты)

## H2 - Заголовок второго уровня

### H3 - Заголовок третьего уровня

#### H4 - Заголовок четвёртого уровня

##### H5 - Заголовок пятого уровня

###### H6 - Заголовок шестого уровня

### Параграфы и текст

Это обычный параграф текста. В дизайн-системе используется шрифт **SF Pro Text** с fallback на system-ui. Размер шрифта 1rem (16px), line-height 1.6 для комфортного чтения.

Можно использовать **жирный текст**, *курсив*, ***жирный курсив***, ~~зачёркнутый текст~~, `инлайн код` и [ссылки](#).

> Это цитата. Цитаты имеют левую границу акцентного цвета и слегка отличающийся фон.

---

## 🔗 Ссылки с иконками

Тестирование автоматических SVG иконок через CSS.

### Системные ссылки

| Система | Описание |
|---------|----------|
| [[Systems/WINDOWS/Windows\|Windows]] | Локальный ПК с PowerShell |
| [[Systems/WSL/WSL\|WSL]] | Ubuntu среда разработки |
| [[Systems/VPS/VPS\|VPS]] | VPS серверы |
| [[Systems/VPS/The Yvn Hub/TheYvnHub\|TheYvnHub]] | Инфраструктурный сервер |
| [[Systems/VPS/The Yvn AI/TheYvnAI\|TheYvnAI]] | AI/LLM сервер |

### Технологические ссылки

| Технология | Описание |
|------------|----------|
| [[Technologies/rclone\|Rclone]] | Облачные хранилища |
| [[Technologies/ssh\|SSH]] | Удалённый доступ |
| [[Technologies/podman\|Podman]] | Управление контейнерами |

### Служебные ссылки

| Ссылка | Назначение |
|--------|------------|
| [[_Templates/Command\|Command]] | Шаблон команды |
| [[_Dashboard/All Commands\|All Commands]] | Все команды |
| [[README\|README]] | Документация |
| [[SETUP\|SETUP]] | Настройки |

---

## 📊 Таблицы

### Простая таблица

| Колонка 1 | Колонка 2 | Колонка 3 |
|-----------|-----------|-----------|
| Значение 1 | Значение 2 | Значение 3 |
| Значение 4 | Значение 5 | Значение 6 |
| Значение 7 | Значение 8 | Значение 9 |

### Таблица с различным контентом

| Property | Value | Status |
|----------|-------|--------|
| **Версия** | 3.0 | ✅ Stable |
| **Стиль** | Apple Music | 🎨 Active |
| **Акцент** | Fire Orange #E85D3D | 🔥 Ready |
| **Иконки** | Lucide SVG | 🚀 CSS-only |

### Dataview-style таблица

```dataview
TABLE description, system, technology
FROM "Snippets"
WHERE system = "WINDOWS"
LIMIT 3
```

---

## 🃏 Карточки (Cards)

### Стандартные карточки

| Card 1 | Card 2 | Card 3 |
|--------|--------|--------|
| **Заголовок 1** | **Заголовок 2** | **Заголовок 3** |
| Описание первой карточки с текстом. | Описание второй карточки с текстом. | Описание третьей карточки с текстом. |

### Карточки с ссылками

| [[Systems/WINDOWS/Windows\|Windows]] | [[Systems/WSL/WSL\|WSL]] | [[Systems/VPS/VPS\|VPS]] |
|------|-----|-----|
| Локальный ПК. PowerShell & CMD команды. | Ubuntu среда разработки и управления. | Удалённые серверы с сервисами. |

---

## 📋 Списки

### Маркированный список

- Первый элемент списка
- Второй элемент списка
  - Вложенный элемент 1
  - Вложенный элемент 2
    - Глубоко вложенный элемент
- Третий элемент списка

### Нумерованный список

1. Первый шаг
2. Второй шаг
   1. Подшаг 2.1
   2. Подшаг 2.2
3. Третий шаг
4. Четвёртый шаг

### Чеклист

- [x] Завершённая задача
- [x] Ещё одна завершённая задача
- [ ] Незавершённая задача
- [ ] Ещё одна незавершённая задача

---

## 💬 Callouts

Тестирование различных типов callout блоков.

> [!note] Заметка
> Это стандартная заметка с информацией.

> [!tip] Совет
> Полезный совет для пользователя.

> [!warning] Предупреждение
> Важное предупреждение о чём-то критичном.

> [!danger] Опасность
> Критическое предупреждение! Будьте осторожны.

> [!success] Успех
> Операция выполнена успешно!

> [!info] Информация
> Дополнительная информация по теме.

> [!question] Вопрос
> Часто задаваемый вопрос и ответ.

> [!example] Пример
> Пример использования функции.

---

## 💻 Код

### Инлайн код

Используйте команду `cd /home/user` для перехода в директорию. Переменная `--launcher-accent` содержит акцентный цвет.

### Блок кода без языка

```
Обычный текст без подсветки синтаксиса.
Вторая строка текста.
Третья строка текста.
```

### Bash

```bash
#!/bin/bash
# Mount rclone remote
rclone mount onedrive: ~/OneDrive --daemon

# Check status
systemctl status service-name

# SSH to server
ssh user@server -p 22
```

### JavaScript

```javascript
// Example JavaScript code
const launcherAccent = '#E85D3D';

function applyTheme(color) {
  document.documentElement.style.setProperty('--launcher-accent', color);
  console.log(`Theme applied: ${color}`);
}

applyTheme(launcherAccent);
```

### CSS

```css
/* Apple Music style card */
.card {
  background: var(--launcher-bg-card);
  border: 1px solid var(--launcher-border-light);
  border-radius: 10px;
  padding: 1.5rem;
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
}

.card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
  border-color: var(--launcher-border-medium);
}
```

### Python

```python
# Example Python code
def calculate_total(items):
    """Calculate total price of items."""
    total = sum(item['price'] for item in items)
    return total

items = [
    {'name': 'Item 1', 'price': 100},
    {'name': 'Item 2', 'price': 200},
]

print(f"Total: ${calculate_total(items)}")
```

### YAML (Frontmatter)

```yaml
---
system: WINDOWS
technology: rclone
tags: [mount, cloud, onedrive]
created: 2026-01-11
description: Mount OneDrive with rclone
---
```

---

## 🎛️ UI Controls

### Переключатели (Toggles)

Настройки Obsidian → Appearance → CSS snippets

- [ ] OFF состояние (видимый серый фон)
- [x] ON состояние (огненно-оранжевый)

### Buttons (если CSS поддерживает)

<button style="padding: 0.5rem 1rem; background: var(--launcher-accent, #E85D3D); color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 600;">
  Primary Button
</button>

<button style="padding: 0.5rem 1rem; background: transparent; color: var(--launcher-text, white); border: 1px solid var(--launcher-border-medium, #404040); border-radius: 6px; cursor: pointer; font-weight: 600; margin-left: 1rem;">
  Secondary Button
</button>

---

## 📐 Spacing & Layout

### Max Width Test

Этот контент должен иметь максимальную ширину 1600px и центрироваться на странице. Проверьте отступы слева и справа.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Grid System

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1.5rem; margin: 2rem 0;">
  <div style="background: var(--launcher-bg-card, #252525); padding: 2rem; border-radius: 10px; text-align: center;">
    Grid Item 1
  </div>
  <div style="background: var(--launcher-bg-card, #252525); padding: 2rem; border-radius: 10px; text-align: center;">
    Grid Item 2
  </div>
  <div style="background: var(--launcher-bg-card, #252525); padding: 2rem; border-radius: 10px; text-align: center;">
    Grid Item 3
  </div>
</div>

---

## 🎭 Hover Effects

Наведите мышь на элементы для проверки hover эффектов.

### Ссылки

- [[README|Документация]] (должна подсвечиваться огненно-оранжевым)
- [[SETUP|Настройки]] (border-bottom при hover)
- [Внешняя ссылка](https://example.com) (цвет и underline)

### Таблицы с hover

| Элемент | Hover Effect | Цвет |
|---------|--------------|------|
| [[Systems/WINDOWS/Windows\|Windows]] | Border-bottom | Fire Orange |
| [[Technologies/rclone\|Rclone]] | Border-bottom | Fire Orange |
| [[Technologies/ssh\|SSH]] | Border-bottom | Fire Orange |

### Карточки с hover

| [[Systems/WINDOWS/Windows\|Windows]] | [[Systems/WSL/WSL\|WSL]] |
|------|-----|
| Должна подниматься вверх на 2px | С subtle тенью |

---

## 🔍 Иконки (SVG через CSS)

Проверка всех автоматических иконок:

1. [[Systems/WINDOWS/Windows|Windows]] - Monitor icon
2. [[Systems/WSL/WSL|WSL]] - Terminal icon
3. [[Systems/VPS/VPS|VPS]] - Globe icon
4. [[Systems/VPS/The Yvn Hub/TheYvnHub|TheYvnHub]] - Globe icon
5. [[Systems/VPS/The Yvn AI/TheYvnAI|TheYvnAI]] - Globe icon
6. [[Technologies/rclone|Rclone]] - Cloud icon
7. [[Technologies/ssh|SSH]] - Key icon
8. [[Technologies/podman|Podman]] - Package icon
9. [[_Templates/Command|Command]] - File Plus icon
10. [[_Dashboard/All Commands|All Commands]] - Library icon
11. [[README|README]] - Book icon
12. [[SETUP|SETUP]] - Settings icon

**Проверь:**
- ✅ Иконки отображаются в Reading View
- ✅ Отступ между иконкой и текстом 0.8em
- ✅ Подчёркивание только под текстом, НЕ под иконкой
- ✅ Hover эффект огненно-оранжевый

---

## 🧩 Сложные элементы

### Nested Lists with Links

1. Системы
   - [[Systems/WINDOWS/Windows|Windows]]
     - PowerShell команды
     - CMD скрипты
   - [[Systems/WSL/WSL|WSL]]
     - Bash команды
     - Linux утилиты
2. Технологии
   - [[Technologies/rclone|Rclone]]
   - [[Technologies/ssh|SSH]]
   - [[Technologies/podman|Podman]]

### Mixed Content Table

| Type | Name | Description | Tags |
|------|------|-------------|------|
| System | [[Systems/WINDOWS/Windows\|Windows]] | Локальный ПК | `powershell` `cmd` |
| System | [[Systems/WSL/WSL\|WSL]] | Ubuntu окружение | `bash` `linux` |
| Tech | [[Technologies/rclone\|Rclone]] | Облака | `mount` `sync` |

---

## ⚡ Анимации

### Transitions Test

Наведите мышь на элементы для проверки transitions:

<div style="background: var(--launcher-bg-card, #252525); padding: 2rem; border-radius: 10px; margin: 1rem 0; transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);">
  <strong>Hover на этот блок</strong><br>
  Должен быть плавный transition (0.2s cubic-bezier)
</div>

### Transform Test

<div style="background: var(--launcher-bg-card, #252525); padding: 2rem; border-radius: 10px; margin: 1rem 0; transition: transform 0.2s cubic-bezier(0.4, 0, 0.2, 1), box-shadow 0.2s cubic-bezier(0.4, 0, 0.2, 1);">
  <strong>Hover для подъёма</strong><br>
  Должен подняться на translateY(-2px) с тенью
</div>

---

## 📱 Responsive Test

Измените ширину окна для проверки адаптивности:

- **Desktop** (>1200px): 3 колонки карточек
- **Tablet** (768-1200px): 2 колонки карточек
- **Mobile** (<768px): 1 колонка карточек

---

## 🛠️ Troubleshooting

### Если стили не применяются:

1. **Перезагрузите Obsidian**: `Ctrl+R` (Windows/Linux) или `Cmd+R` (Mac)
2. **Проверьте CSS snippets**: Settings → Appearance → CSS snippets
3. **Убедитесь что включены все 15 сниппетов**:
   - 00-reset.css ✅
   - 00-ui-controls.css ✅
   - 00-animations.css ✅
   - 01-variables.css ✅
   - 02-tables.css ✅
   - 03-links.css ✅
   - 04-callouts.css ✅
   - 05-headings.css ✅
   - 06-layout.css ✅
   - 06-list.css ✅
   - 06-code.css ✅
   - 07-grid-system.css ✅
   - 08-cards.css ✅
   - 09-svg-icons.css ✅

4. **Режим просмотра**: Убедитесь что вы в **Reading View** (иконки работают только там)

---

## 📝 Заметки для Cascade AI

> **ВАЖНО**: Этот файл - песочница для экспериментов!
>
> **Workflow:**
> 1. Cascade AI вносит изменения в CSS файлы
> 2. Проверяет результат в ЭТОМ файле (TEST-CSS.md)
> 3. Показывает скриншот пользователю
> 4. Если пользователь одобряет → применяет в основные файлы
> 5. Если нет → откатывает и пробует другой подход

**НЕ применяй изменения в основные CSS файлы без одобрения пользователя!**

---

**Версия**: 3.0 (Apple Music Design System)
**Последнее обновление**: 2026-01-11
**Статус**: Production Ready ✅ (Cleaned v3.0)
