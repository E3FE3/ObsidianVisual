---
cssclasses: dashboard
---

<div class="dashboard-header">
  <h1>🚀 LAUNCHER</h1>
  <p class="subtitle">Центр управления инфраструктурой</p>
</div>

<div class="section-header">
  <span class="section-icon">🖥️</span>
  <h2 class="section-title">Системы</h2>
</div>

<div class="dashboard-grid">
  <div class="card card-success">
    <div class="card-header">
      <span class="card-icon">🪟</span>
      <h3 class="card-title">WINDOWS</h3>
    </div>
    <div class="card-body">
      <p><strong>Локальный Windows PC</strong></p>
      <p>Команды выполняются в PowerShell или CMD</p>
    </div>
    <div class="card-footer">
      <a href="Systems/WINDOWS/Windows" class="btn btn-outline">📂 Открыть →</a>
    </div>
  </div>

  <div class="card card-info">
    <div class="card-header">
      <span class="card-icon">🐧</span>
      <h3 class="card-title">WSL</h3>
    </div>
    <div class="card-body">
      <p><strong>Ubuntu на Windows</strong></p>
      <p>Linux окружение для разработки и управления</p>
    </div>
    <div class="card-footer">
      <a href="Systems/WSL/WSL" class="btn btn-outline">📂 Открыть →</a>
    </div>
  </div>

  <div class="card card-warning">
    <div class="card-header">
      <span class="card-icon">🌐</span>
      <h3 class="card-title">VPS</h3>
    </div>
    <div class="card-body">
      <p><strong>Удалённые серверы</strong></p>
      <ul>
        <li><a href="Systems/VPS/The Yvn Hub/TheYvnHub">TheYvnHub</a> - Инфраструктура</li>
        <li><a href="Systems/VPS/The Yvn AI/TheYvnAI">TheYvnAI</a> - AI Server</li>
      </ul>
    </div>
    <div class="card-footer">
      <a href="Systems/VPS/VPS" class="btn btn-outline">📂 Открыть →</a>
    </div>
  </div>
</div>

<div class="divider"></div>

<div class="section-header">
  <span class="section-icon">⚡</span>
  <h2 class="section-title">Недавно добавленные команды</h2>
</div>

```dataview
TABLE WITHOUT ID
  ("⚡ " + file.link) AS "Команда",
  system AS "🖥️ Система",
  technology AS "🔧 Технология",
  description AS "📝 Описание"
FROM "Snippets" OR "Scripts"
WHERE file.name != "Home" AND file.name != "All Commands"
SORT created DESC
LIMIT 10
```

<div class="divider"></div>

<div class="section-header">
  <span class="section-icon">🛠️</span>
  <h2 class="section-title">Технологии</h2>
</div>

<div class="dashboard-grid">
  <div class="card">
    <div class="card-header">
      <span class="card-icon">🔐</span>
      <h3 class="card-title">rclone</h3>
    </div>
    <div class="card-body">
      <p>Монтирование VPS серверов как локальных дисков</p>
      <span class="badge badge-success">Активно</span>
    </div>
    <div class="card-footer">
      <a href="Technologies/rclone" class="btn btn-primary">Подробнее →</a>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="card-icon">🔑</span>
      <h3 class="card-title">ssh</h3>
    </div>
    <div class="card-body">
      <p>Безопасное подключение к удалённым серверам</p>
      <span class="badge badge-info">Готово</span>
    </div>
    <div class="card-footer">
      <a href="Technologies/ssh" class="btn btn-primary">Подробнее →</a>
    </div>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="card-icon">📦</span>
      <h3 class="card-title">podman</h3>
    </div>
    <div class="card-body">
      <p>Управление контейнерами на VPS серверах</p>
      <span class="badge badge-warning">В разработке</span>
    </div>
    <div class="card-footer">
      <a href="Technologies/podman" class="btn btn-primary">Подробнее →</a>
    </div>
  </div>
</div>

<div class="divider"></div>

<div class="section-header">
  <span class="section-icon">🎯</span>
  <h2 class="section-title">Быстрые действия</h2>
</div>

<div class="quick-actions">
  <a href="_Templates/Command" class="action-card">
    <div class="action-icon">📝</div>
    <h4 class="action-title">Создать команду</h4>
  </a>

  <a href="_Dashboard/All Commands" class="action-card">
    <div class="action-icon">📚</div>
    <h4 class="action-title">Все команды</h4>
  </a>

  <a href="Systems/WINDOWS/Windows" class="action-card">
    <div class="action-icon">🪟</div>
    <h4 class="action-title">WINDOWS</h4>
  </a>

  <a href="Systems/WSL/WSL" class="action-card">
    <div class="action-icon">🐧</div>
    <h4 class="action-title">WSL</h4>
  </a>

  <a href="Systems/VPS/VPS" class="action-card">
    <div class="action-icon">🌐</div>
    <h4 class="action-title">VPS</h4>
  </a>

  <a href="README" class="action-card">
    <div class="action-icon">📖</div>
    <h4 class="action-title">Документация</h4>
  </a>
</div>

<div class="divider"></div>

<div class="section-header">
  <span class="section-icon">📊</span>
  <h2 class="section-title">Статистика</h2>
</div>

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

<div class="dashboard-footer">
  <p><strong>LAUNCHER v1.0</strong></p>
  <p>Последнее обновление: 2026-01-10</p>
  <p><a href="SETUP">⚙️ Настройки</a> • <a href="README">📖 Документация</a></p>
</div>
