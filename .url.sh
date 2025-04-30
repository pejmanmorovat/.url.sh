#!/bin/bash

# Function to open URL in Chrome
open_in_chrome() {
    local url="$1"

    # Check if URL is provided
    if [[ -z "$url" ]]; then
        echo "❌ Error: Please provide a URL."
        echo "Usage: open_in_chrome 'https://example.com'"
        return 1
    fi

    # Add 'https://' if missing
    if [[ ! "$url" =~ ^https?:// ]]; then
        url="https://$url"
    fi

    # Open URL using Termux
    if termux-open-url "$url" &> /dev/null; then
        echo "✅ Success: Opening '$url' in Chrome..."
    else
        echo "❌ Error: Failed to open URL. Is Chrome installed?"
        return 1
    fi
}

# If script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ "$#" -eq 0 ]]; then
        echo "ℹ️  Please enter a URL:"
        read -r url
        open_in_chrome "$url"
    else
        open_in_chrome "$1"
    fi
fi
