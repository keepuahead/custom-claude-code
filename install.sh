#!/bin/bash

# Free Claude Code - Quick Install Script
# This script installs Free Claude Code with all dependencies

set -e

echo "🚀 Free Claude Code - Quick Installer"
echo "======================================"
echo ""

# Check Node.js version
NODE_VERSION=$(node -v 2>/dev/null | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ -z "$NODE_VERSION" ] || [ "$NODE_VERSION" -lt 20 ]; then
    echo "❌ Node.js 20 or higher is required. Please install it first."
    echo "   Download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"
echo ""

# Step 1: Install Claude Code specific version
echo "📦 Step 1: Installing Claude Code v2.0.64..."
npm install -g @anthropic-ai/claude-code@2.0.64
echo "✅ Claude Code installed"
echo ""

# Step 2: Install Free Claude Code
echo "📦 Step 2: Installing Free Claude Code..."
npm install -g @keepuahead/free-claude-code
echo "✅ Free Claude Code installed"
echo ""

# Step 3: Create config directory
CONFIG_DIR="$HOME/.free-claude-code"
mkdir -p "$CONFIG_DIR"

# Step 4: Create example config if not exists
CONFIG_FILE="$CONFIG_DIR/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "📝 Step 3: Creating example configuration..."
    cat > "$CONFIG_FILE" << 'EOF'
{
  "LOG": true,
  "API_TIMEOUT_MS": 600000,
  "Providers": [
    {
      "name": "freeaiapikey",
      "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
      "api_key": "YOUR_API_KEY_HERE",
      "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
    }
  ],
  "Router": {
    "default": "freeaiapikey,gpt-5"
  }
}
EOF
    echo "✅ Configuration file created at: $CONFIG_FILE"
    echo ""
    echo "⚠️  IMPORTANT: Edit $CONFIG_FILE and add your API key!"
    echo "   Get $2 FREE credit at: https://freeaiapikey.com"
else
    echo "✅ Configuration file already exists at: $CONFIG_FILE"
fi

echo ""
echo "======================================"
echo "🎉 Installation Complete!"
echo ""
echo "Next Steps:"
echo "-----------"
echo "1. Edit your config: ~/.free-claude-code/config.json"
echo "2. Add your API key (get $2 free at https://freeaiapikey.com)"
echo "3. Run: fcc code"
echo ""
echo "Commands:"
echo "  fcc start    - Start the router server"
echo "  fcc code     - Run Claude Code"
echo "  fcc model    - Change model interactively"
echo "  fcc ui       - Open web configuration"
echo "  fcc help     - Show all commands"
echo ""
echo "📚 Documentation: https://github.com/keepuahead/custom-claude-code"
echo "💰 Get cheap AI APIs: https://freeaiapikey.com"
echo ""