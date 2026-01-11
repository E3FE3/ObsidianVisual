# Structure Audit

## Overview
The repository currently uses a snippet-based approach for theming, located in `.obsidian/snippets/`.
The vault appears to use "Minimal" as a base conceptually (via `minimal-launcher` snippet), but relies heavily on custom CSS files.

## File Structure
- `.obsidian/snippets/`: Contains modular CSS files.
  - `00-reset.css`: Base resets.
  - `00-ui-controls.css`: UI elements.
  - `01-variables.css`: **Core variables**. Defines `--launcher-accent: #E85D3D` (Fire Orange) and dark theme colors.
  - `06-layout.css`: Layout specifics.
  - `09-svg-icons.css`: Icon definitions.

## Key Findings
- **Accent Color**: Defined in `01-variables.css` as `#E85D3D`. The user refers to this as "Fire Orange".
- **Fonts**: Currently uses `-apple-system`, `BlinkMacSystemFont`, `"SF Pro Display"`, etc. This aligns well with the request.
- **Dark Mode**: The variables already prioritize dark mode (`#1A1A1A`, `#252525`).

## Transformation Strategy
- We will create a new Theme file: `.obsidian/themes/AppleMusic/theme.css`.
- This theme will consolidate the logic from the snippets into a cohesive Apple Music style.
- We will ensure the specific "Fire Orange" `#E85D3D` is used as the primary accent.
