#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Chrome Tab URL
# @raycast.mode silent

# Optional parameters:
# @raycast.icon https://svgl.app/library/chrome.svg

# Documentation:
# @raycast.description Copy the URL of the current Google Chrome tab to clipboard
# @raycast.author jopcmelo
# @raycast.authorURL https://raycast.com/jopcmelo

-- Check if Chrome is the frontmost application
tell application "System Events"
    set frontmostApp to name of first application process whose frontmost is true
end tell

if frontmostApp is "Google Chrome" then
    tell application "Google Chrome"
        -- Get the URL of the active tab in the frontmost window
        if (count of windows) > 0 then
            set currentURL to URL of active tab of front window
            
            -- Copy URL to clipboard
            set the clipboard to currentURL
            
            -- Show confirmation toast with the URL
            display notification currentURL with title "? URL Copied!" subtitle "Chrome tab URL copied to clipboard"
        else
            -- Handle case where no Chrome windows are open
            display notification "No Chrome windows are open" with title "? Error" subtitle "Please open a Chrome tab first"
        end if
    end tell
else
    -- Chrome is not focused, do nothing or show a brief notification
    display notification "Please focus on Google Chrome first" with title "?? Chrome Not Focused" subtitle "Script only works when Chrome is active"
end if
