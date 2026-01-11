# Implementation Plan: Apple Music Theme

## 1. Directory Structure
Create `.obsidian/themes/AppleMusic/theme.css`.

## 2. CSS Variables (`theme.css`)
We will override Obsidian's core variables to match the Apple Music spec.

```css
.theme-dark {
  /* Backgrounds */
  --background-primary: #1E1E1E; /* Main Content */
  --background-primary-alt: #262626; /* Sidebar / Elevated */
  --background-secondary: #262626; /* Sidebar */
  --background-secondary-alt: #2C2C2C;

  /* Text */
  --text-normal: #FFFFFF;
  --text-muted: #98989D;
  --text-faint: #636366;

  /* Accent */
  --interactive-accent: #E85D3D;
  --interactive-accent-hover: #FF6B4A;
  --text-accent: #E85D3D;

  /* UI */
  --radius-s: 6px;
  --radius-m: 10px; /* Cards */
  --radius-l: 12px;

  /* Fonts */
  --font-interface: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Inter", sans-serif;
  --font-text: -apple-system, BlinkMacSystemFont, "SF Pro Text", "Inter", sans-serif;
}
```

## 3. Component Styling

### 3.1 Workspace & Sidebar
- **Sidebar**:
  - Background color matches `--background-secondary`.
  - Navigation items: padding `8px 12px`, border-radius `8px`.
  - Active item: background color `rgba(232, 93, 61, 0.15)` (Orange tint) or Dark Gray `#3A3A3A` with Orange text.
- **Main Container**:
  - Remove default borders between panes if possible for a cleaner look.

### 3.2 Typography & Content
- Headers: `font-weight: 700`.
- Body: `line-height: 1.6`.

### 3.3 Inputs & Controls
- Checkboxes: Round or soft square, orange when checked.
- Buttons: Filled orange, white text, radius 6-8px.

### 3.4 Translucency
- If transparency is enabled in Obsidian:
  ```css
  body.is-translucent .workspace-ribbon,
  body.is-translucent .workspace-split.mod-left-split {
      background-color: rgba(38, 38, 38, 0.7);
      backdrop-filter: saturate(180%) blur(20px);
  }
  ```

## 4. Execution
1. Create folder/file.
2. Populate CSS.
3. Validate syntax.
