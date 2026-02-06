#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Current Tab URL
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ??

# Documentation:
# @raycast.description Copy the URL of the current Chrome tab to clipboard
# @raycast.author jopcmelo
# @raycast.authorURL https://raycast.com/jopcmelo

tell application "Chrome"
    if (count of windows) > 0 then
        set currentURL to URL of active tab of front window
        set the clipboard to currentURL
    else
        display notification "No Chrome windows open" with title "Copy URL"
    end if
end tell