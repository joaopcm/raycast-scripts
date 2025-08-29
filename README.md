# Raycast AppleScript Generator

This project contains a reusable system for generating Raycast AppleScript files that open various web applications in Chrome. Instead of maintaining multiple duplicate files, all scripts are now generated from a single configuration file.

## How It Works

All AppleScript files are generated from:
- **`services-config.json`** - Configuration for all services
- **`template.applescript`** - The AppleScript template with placeholders
- **`generate-scripts.js`** - Generator that creates individual `.applescript` files

## Files Structure

```
scripts/
├── services-config.json      # Service definitions
├── template.applescript      # AppleScript template  
├── generate-scripts.js       # Generator script
├── open-*.applescript        # Generated files (15 total)
└── README.md                # This documentation
```

## Adding a New Service

To add a new web application:

1. **Edit `services-config.json`** and add a new service:
   ```json
   {
     "name": "example",
     "title": "Open Example",
     "description": "Example App", 
     "icon": "https://example.com/icon.svg",
     "targetUrl": "https://example.com/",
     "domainCheck": "example.com"
   }
   ```

2. **Run the generator**:
   ```bash
   node generate-scripts.js
   ```

3. **Done!** A new `open-example.applescript` file will be created.

## Configuration Fields

Each service in `services-config.json` requires:

- **`name`**: Used for the filename (`open-{name}.applescript`)
- **`title`**: Raycast command title
- **`description`**: Raycast command description  
- **`icon`**: SVG icon URL (preferably from https://svgl.app/)
- **`targetUrl`**: The URL to open
- **`domainCheck`**: Domain substring to check for existing tabs

## Updating All Scripts

When you modify the template or any service configuration:

```bash
node generate-scripts.js
```

This will regenerate all 15 AppleScript files with the latest changes.

## Benefits

✅ **Single source of truth** - All configuration in one place  
✅ **Easy to add new services** - Just edit JSON and regenerate  
✅ **Consistent behavior** - All scripts use the same logic  
✅ **Easy maintenance** - Update template once, applies to all  
✅ **No code duplication** - Eliminates redundant AppleScript code

## Current Services

The system currently generates scripts for:
- ChatGPT, Discord, Figma, Gmail, Linear
- MyMind, Notion, Notion Calendar, Postman
- Slack, Spotify, Todoist, WhatsApp
- X (Twitter), YouTube
