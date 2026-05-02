#!/usr/bin/env bash

status=$(timeout 0.3s playerctl status 2>/dev/null) || {
    echo "󰝛 No media is playing."
    exit 0
}

if [ "$status" = "Playing" ]; then
    text=$(timeout 0.3s playerctl metadata --format "{{title}} - {{artist}}" 2>/dev/null)

    if [ ${#text} -gt 30 ]; then
        text="${text:0:27}..."
    fi

    echo "󰝚 $text"
else
    echo "󰝛 No media is playing."
fi
