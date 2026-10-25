#!/usr/bin/env bash
# Setup script for YT Bulk Subtitles Downloader on Arch Linux (and other Linux distros).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "================================================"
echo "Setting up YT Bulk Subtitles Downloader"
echo "================================================"
echo

if ! command -v python3 &>/dev/null; then
    echo "Python 3 is not installed. Install it first, e.g.:"
    echo "  sudo pacman -S python"
    exit 1
fi

if ! command -v chromium &>/dev/null && ! command -v google-chrome-stable &>/dev/null && ! command -v google-chrome &>/dev/null; then
    echo "No Chromium/Chrome browser found. The proxy-list feature needs one to run."
    echo "Install it with:"
    echo "  sudo pacman -S chromium"
    echo "(the tool still works without it; proxy fetching will just be skipped)"
    echo
fi

echo "Creating virtual environment..."
python3 -m venv venv
echo "Virtual environment created."
echo

echo "Installing dependencies..."
venv/bin/pip install --upgrade pip -q
venv/bin/pip install -r requirements.txt -q
echo "Dependencies installed."
echo

echo "================================================"
echo "Setup complete! Run ./start.sh to launch the tool."
echo "================================================"
