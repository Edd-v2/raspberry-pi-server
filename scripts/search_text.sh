#!/bin/bash

# Check if user provided a search term
if [ "$#" -ne 1 ]; then
    echo "❌ Usage: $0 <search-text>"
    exit 1
fi

SEARCH_TERM=$1

echo "🔎 Searching for: '$SEARCH_TERM'"

# Search in all files recursively starting from current directory
grep -rnw '.' -e "$SEARCH_TERM" --color=always
