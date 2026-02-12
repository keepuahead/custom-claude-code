#!/bin/bash

# Free Claude Code - One-Line Installer for Mac/Linux
# Usage: curl -fsSL https://raw.githubusercontent.com/keepuahead/custom-claude-code/main/install.sh | bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Animated spinner
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                                                              ║${NC}"
echo -e "${CYAN}║   🚀 Free Claude Code - One-Line Installer                  ║${NC}"
echo -e "${CYAN}║   Use Claude Code with ANY API - Save up to 80%!            ║${NC}"
echo -e "${CYAN}║                                                              ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check Node.js
echo -e "${BLUE}➤ Checking Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}✗ Node.js is not installed!${NC}"
    echo ""
    echo "Please install Node.js 20+ from: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo -e "${RED}✗ Node.js 20+ is required. You have $(node -v)${NC}"
    echo "Please upgrade from: https://nodejs.org/"
    exit 1
fi

echo -e "${GREEN}✓ Node.js $(node -v) detected${NC}"
echo ""

# Step 1: Install Claude Code v2.0.64
echo -e "${BLUE}➤ Step 1/3: Installing Claude Code v2.0.64...${NC}"
npm install -g @anthropic-ai/claude-code@2.0.64 2>&1 | while read -r line; do
    printf "\r   %s" "$line"
done
echo ""
echo -e "${GREEN}✓ Claude Code v2.0.64 installed${NC}"
echo ""

# Step 2: Install Free Claude Code
echo -e "${BLUE}➤ Step 2/3: Installing Free Claude Code...${NC}"
npm install -g @keepuahead/free-claude-code 2>&1 | while read -r line; do
    printf "\r   %s" "$line"
done
echo ""
echo -e "${GREEN}✓ Free Claude Code installed${NC}"
echo ""

# Step 3: Create config directory
CONFIG_DIR="$HOME/.free-claude-code"
CONFIG_FILE="$CONFIG_DIR/config.json"

echo -e "${BLUE}➤ Step 3/3: Setting up configuration...${NC}"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    cat > "$CONFIG_FILE" << 'CONFIGEOF'
{
  "Providers": [{
    "name": "freeaiapikey",
    "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
    "api_key": "YOUR_API_KEY_HERE",
    "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
  }],
  "Router": {
    "default": "freeaiapikey,gpt-5"
  }
}
CONFIGEOF
    echo -e "${GREEN}✓ Config template created${NC}"
else
    echo -e "${YELLOW}! Config already exists, keeping it${NC}"
fi
echo ""

# Done!
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                                              ║${NC}"
echo -e "${GREEN}║   ✅ INSTALLATION COMPLETE!                                  ║${NC}"
echo -e "${GREEN}║                                                              ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Next Steps:${NC}"
echo ""
echo -e "  ${YELLOW}1.${NC} Edit your config:"
echo -e "     ${BLUE}~/.free-claude-code/config.json${NC}"
echo ""
echo -e "     Add your API key (get \$2 FREE at ${GREEN}https://freeaiapikey.com${NC})"
echo ""
echo -e "  ${YELLOW}2.${NC} Start coding:"
echo ""
echo -e "     ${GREEN}fcc code${NC}"
echo ""
echo -e "${CYAN}Commands:${NC}"
echo -e "   ${GREEN}fcc code${NC}     Start coding with Claude"
echo -e "   ${GREEN}fcc start${NC}    Start router server"
echo -e "   ${GREEN}fcc stop${NC}     Stop router server"
echo -e "   ${GREEN}fcc status${NC}   Show server status"
echo -e "   ${GREEN}fcc model${NC}    Switch model"
echo -e "   ${GREEN}fcc ui${NC}       Open web config"
echo ""
echo -e "${CYAN}Need help?${NC} https://github.com/keepuahead/custom-claude-code"
echo ""