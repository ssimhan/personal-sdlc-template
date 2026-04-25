#!/bin/bash

# Configuration
SOURCE_REPO="../claude-code-quickstart"
SOURCE_DIR="$SOURCE_REPO/.agent/workflows"
DEST_DIR=".agent/workflows"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Header
echo -e "${BLUE}=== bidirectional Workflow Sync ===${NC}"
echo "Quickstart (Gold Source): $SOURCE_DIR"
echo "Local Project:            $DEST_DIR"
echo "----------------------------------------"

# validation
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Error: Quickstart repo not found at $SOURCE_REPO${NC}"
    exit 1
fi

mkdir -p "$DEST_DIR"

# Get unique list of all .md files from both directories
files=$(cat <(ls "$SOURCE_DIR"/*.md 2>/dev/null) <(ls "$DEST_DIR"/*.md 2>/dev/null) | xargs -n 1 basename | sort -u)

for file in $files; do
    src="$SOURCE_DIR/$file"
    dest="$DEST_DIR/$file"

    # Case 1: File exists in both
    if [[ -f "$src" && -f "$dest" ]]; then
        if cmp -s "$src" "$dest"; then
            echo -e "${GREEN}✔ $file is in sync${NC}"
        else
            echo -e "${YELLOW}⚠ $file differs${NC}"
            
            # Show simplified diff stat
            diff --stat "$src" "$dest"
            
            # Simple timestamp check to guess direction
            if [[ "$src" -nt "$dest" ]]; then
                 suggestion="(Quickstart is newer)"
            else
                 suggestion="(Local is newer)"
            fi

            echo -e "  Choice: $suggestion"
            read -p "  [P]ull from Quickstart / [U]pload to Quickstart / [S]kip? (p/u/s): " choice < /dev/tty
            
            case "$choice" in
                p|P) cp "$src" "$dest"; echo "  -> Pulled." ;;
                u|U) cp "$dest" "$src"; echo "  -> Uploaded." ;;
                *) echo "  -> Skipped." ;;
            esac
        fi

    # Case 2: Only in Quickstart
    elif [[ -f "$src" ]]; then
        echo -e "${BLUE}? $file is new in Quickstart${NC}"
        read -p "  Import to Local? [Y/n]: " choice < /dev/tty
        if [[ "$choice" != "n" && "$choice" != "N" ]]; then
            cp "$src" "$dest"
            echo "  -> Imported."
        fi

    # Case 3: Only in Local
    elif [[ -f "$dest" ]]; then
        echo -e "${BLUE}? $file is unique to Local${NC}"
        read -p "  Promote to Quickstart (Global)? [y/N]: " choice < /dev/tty
        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
            cp "$dest" "$src"
            echo "  -> Promoted."
        fi
    fi
done

echo -e "${BLUE}=== Sync Complete ===${NC}"
