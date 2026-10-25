#!/usr/bin/env bash
# Launch script for YT Bulk Subtitles Downloader on Arch Linux (and other Linux distros).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -x venv/bin/python ]; then
    echo "Virtual environment not found. Run ./setup.sh first."
    exit 1
fi

venv/bin/python ytbsd.py
