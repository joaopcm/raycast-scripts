#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open WhatsApp Web
# @raycast.mode silent

# Optional parameters:
# @raycast.icon https://svgl.app/library/whatsapp.svg
# @raycast.packageName WhatsApp Web

# Documentation:
# @raycast.author jopcmelo
# @raycast.authorURL https://raycast.com/jopcmelo

tell application "Comet"
    activate
    
    set targetURL to "https://web.whatsapp.com"
    set tabFound to false
    
    -- Check all windows and tabs for the URL
    if (count of windows) > 0 then
        repeat with w from 1 to count of windows
            repeat with t from 1 to count of tabs of window w
                try
                    if URL of tab t of window w contains "web.whatsapp.com" then
                        set active tab index of window w to t
                        set index of window w to 1
                        set tabFound to true
                        exit repeat
                    end if
                end try
            end repeat
            if tabFound then exit repeat
        end repeat
    end if
    
    -- If tab not found, create new window/tab
    if not tabFound then
        if (count of windows) = 0 then
            make new window with properties {URL:targetURL}
        else
            tell window 1
                make new tab with properties {URL:targetURL}
            end tell
        end if
    end if
end tell
