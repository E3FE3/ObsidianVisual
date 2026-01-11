# User Guide: Apple Music Theme

## Overview
This theme transforms Obsidian into a visually stunning environment inspired by the Apple Music Desktop app (Dark Mode), featuring the requested "Fire Orange" accent color.

## Installation & Activation

1. **Open Obsidian Settings**.
2. Navigate to **Appearance**.
3. Under **Themes**, select **AppleMusic**.
4. Ensure **Base color scheme** is set to **Dark**.

> **Note:** This theme requires certain default CSS snippets to be disabled to work correctly. The configuration file `appearance.json` has been automatically updated to disable conflicting snippets (like `00-reset`, `01-variables`). If you manually re-enable them, the theme might not look correct.

## Recommended Settings for Best Experience

### Appearance
- **Translucency effect**: **On** (This enables the blurry sidebar background).
- **Window frame style**: **Hidden** (This integrates the title bar with the sidebar).
- **Font**: The theme uses System Fonts (`-apple-system`). You do not need to install anything extra.

### Plugins (Optional but Recommended)
- **Hiding UI**: To get the cleanest look, you might want to collapse the right sidebar.

## Troubleshooting
- **If colors look wrong**: Ensure you are in Dark Mode.
- **If elements look standard**: Check *Settings > Appearance > CSS snippets* and ensure `00-reset` and `01-variables` are disabled.
