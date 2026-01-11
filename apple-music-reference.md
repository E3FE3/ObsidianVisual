# Apple Music Desktop (Dark Mode) Reference

## Color Palette
- **Backgrounds**:
  - Sidebar: `#262626` (approx) or Translucent with Vibrancy.
  - Main Content: `#1E1E1E` (Darker than sidebar).
  - Cards/Elevated: `#2C2C2C` or `#333333` on hover.
  - Borders: `#3A3A3A` (Subtle).
- **Text**:
  - Primary: `#FFFFFF` (100% or 95% opacity).
  - Secondary: `#98989D` (approx 60% opacity).
  - Tertiary: `#555555`.
- **Accent**:
  - Original: `#FA2D48` (Pink/Red).
  - **Target**: `#E85D3D` (Fire Orange) as requested.

## Typography
- **Font Stack**: `-apple-system`, `BlinkMacSystemFont`, `Inter`, `ui-sans-serif`.
- **Sizes**:
  - Sidebar Items: 14px or 15px.
  - Headers: Bold, tight letter-spacing.
  - Body: 16px.

## UI Elements & Layout
- **Sidebar**:
  - Width: ~260px.
  - Active Item: Rounded rectangle (Radius ~8px), background matches accent (low opacity) or gray, text colored accent.
  - Sections: clearly divided by spacing or small headers.
- **Main View**:
  - Padding: Generous (30px+).
  - Grid Layout for albums/playlists (applicable to Dataview/Cards).
- **Window**:
  - Traffic Lights: Integrated into the sidebar.
  - Scrollbars: Overlay, invisible until scrolled.

## Animations
- **Transitions**: Smooth, ~200ms `cubic-bezier(0.25, 0.1, 0.25, 1)`.
- **Hover Effects**: Instant reaction but smooth fade out.
