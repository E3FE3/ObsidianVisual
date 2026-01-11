---
cssclasses: dashboard
---

# 🧪 Тест CSS Стилей LAUNCHER 3.0

Этот файл демонстрирует новые возможности обновленного дизайна: Glassmorphism, Mesh Gradients и плавные анимации.

<div class="dashboard-header">
  <h1>✨ LAUNCHER 3.0</h1>
  <p class="subtitle">Ultra-Modern High-Performance UI</p>
</div>

---

## 💎 Эффект Glassmorphism
Карточки теперь имеют эффект матового стекла, тонкие границы и мягкое свечение.

<div class="dashboard-grid">
  <div class="card">
    <div class="card-header">
      <span class="card-icon">💎</span>
      <h3 class="card-title">Glass Card</h3>
    </div>
    <div class="card-body">
      <p>Стандартная карточка с эффектом <strong>Glassmorphism</strong> и адаптивным фоном.</p>
    </div>
    <div class="card-footer">
      <span class="badge">Modern</span>
      <span class="badge">Glass</span>
    </div>
  </div>

  <div class="card card-success">
    <div class="card-header">
      <span class="card-icon">🚀</span>
      <h3 class="card-title">Success Glow</h3>
    </div>
    <div class="card-body">
      <p>Карточка со статусом <strong>Success</strong>. Наведите, чтобы увидеть мягкое зеленое свечение.</p>
    </div>
    <div class="card-footer">
      <span class="badge badge-success">Active</span>
    </div>
  </div>

  <div class="card card-info">
    <div class="card-header">
      <span class="card-icon">⚡</span>
      <h3 class="card-title">Interactive UI</h3>
    </div>
    <div class="card-body">
      <p>Плавные анимации при наведении: карточка приподнимается, иконка слегка вращается.</p>
    </div>
    <div class="card-footer">
      <span class="badge badge-info">Fast</span>
    </div>
  </div>
</div>

---

## 🔘 Современные кнопки
Кнопки в стиле Linear с улучшенными тенями и состояниями наведения.

<div style="display: flex; gap: 1.5rem; margin: 2rem 0; align-items: center;">
  <a href="#" class="btn btn-primary">Primary Action</a>
  <a href="#" class="btn btn-outline">Secondary View</a>
</div>

---

## 🎯 Быстрые действия (Tiles)
Обновленный компактный дизайн для быстрой навигации.

<div class="quick-actions">
  <a href="#" class="action-card">
    <span class="action-icon">🏠</span>
    <span class="action-title">Home</span>
  </a>
  <a href="#" class="action-card">
    <span class="action-icon">📋</span>
    <span class="action-title">Tasks</span>
  </a>
  <a href="#" class="action-card">
    <span class="action-icon">⚙️</span>
    <span class="action-title">Config</span>
  </a>
  <a href="#" class="action-card">
    <span class="action-icon">📊</span>
    <span class="action-title">Stats</span>
  </a>
</div>

---

## 📊 Таблицы Dataview
Улучшенная читаемость и современный вид таблиц.

<div class="dashboard">
  <table class="dataview table-view-table">
    <thead>
      <tr>
        <th>Свойство</th>
        <th>Значение</th>
        <th>Статус</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Версия дизайна</td>
        <td>3.0 Platinum</td>
        <td><span class="badge badge-success">Stable</span></td>
      </tr>
      <tr>
        <td>Glassmorphism</td>
        <td>Включено (Blur 12px)</td>
        <td><span class="badge badge-info">Active</span></td>
      </tr>
      <tr>
        <td>Анимации</td>
        <td>Natural Bezier</td>
        <td><span class="badge badge-warning">Testing</span></td>
      </tr>
    </tbody>
  </table>
</div>

---

## 🛠️ Если стили не применились

1. **Ctrl+R** — принудительная перезагрузка Obsidian.
2. Проверьте **Settings → Appearance → CSS snippets**, что `dashboard` включен.
3. Убедитесь, что в YAML файле указано `cssclasses: dashboard`.

<div class="dashboard-footer">
  <p>LAUNCHER Professional Dashboard Update</p>
  <p><a href="#">Вернуться в документацию</a></p>
</div>
