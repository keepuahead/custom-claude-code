# 🚀 Free Claude Code - Easiest Way to Use Claude Code with ANY API

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![One-Line Install](https://img.shields.io/badge/install-one%20line-brightgreen)](https://github.com/keepuahead/custom-claude-code)

> **⚡ The EASIEST setup to use Claude Code with custom API endpoints. One command. Done.**

---

## 🎯 One-Line Installation

### Windows (PowerShell) - Run as Administrator

```powershell
irm https://raw.githubusercontent.com/keepuahead/custom-claude-code/main/install.ps1 | iex
```

### Mac/Linux

```bash
curl -fsSL https://raw.githubusercontent.com/keepuahead/custom-claude-code/main/install.sh | bash
```

### Install with NPM (Alternative)

```bash
npm install -g @anthropic-ai/claude-code@2.0.64 && npm install -g @keepuahead/free-claude-code && fcc start
```

### Or Install from Source

```bash
# Clone and install
git clone https://github.com/keepuahead/custom-claude-code.git
cd custom-claude-code
pnpm install && pnpm build
npm link

# Install Claude Code
npm install -g @anthropic-ai/claude-code@2.0.64
```

---

## ⚡ Quick Setup (30 Seconds)

### Step 1: Create Config File

Create `~/.free-claude-code/config.json`:

**Windows:** `C:\Users\YOUR_NAME\.free-claude-code\config.json`
**Mac/Linux:** `~/.free-claude-code/config.json`

```json
{
  "Providers": [{
    "name": "myapi",
    "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
    "api_key": "YOUR_API_KEY",
    "models": ["gpt-5", "claude-sonnet-4.5"]
  }],
  "Router": { "default": "myapi,gpt-5" }
}
```

### Step 2: Run!

```bash
fcc code
```

**That's it!** You're now using Claude Code with your custom API. 🎉

---

## 🌟 Popular Providers

### FreeAIAPIKey.com (Recommended - 80% Cheaper!)

```json
{
  "Providers": [{
    "name": "freeaiapikey",
    "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
    "api_key": "YOUR_KEY",
    "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
  }],
  "Router": { "default": "freeaiapikey,gpt-5" }
}
```
👉 **Get $2 FREE credit at [freeaiapikey.com](https://freeaiapikey.com)**

### DeepSeek

```json
{
  "Providers": [{
    "name": "deepseek",
    "api_base_url": "https://api.deepseek.com/chat/completions",
    "api_key": "YOUR_KEY",
    "models": ["deepseek-chat"]
  }],
  "Router": { "default": "deepseek,deepseek-chat" }
}
```

### OpenRouter

```json
{
  "Providers": [{
    "name": "openrouter",
    "api_base_url": "https://openrouter.ai/api/v1/chat/completions",
    "api_key": "YOUR_KEY",
    "models": ["anthropic/claude-sonnet-4"]
  }],
  "Router": { "default": "openrouter,anthropic/claude-sonnet-4" }
}
```

### OpenAI

```json
{
  "Providers": [{
    "name": "openai",
    "api_base_url": "https://api.openai.com/v1/chat/completions",
    "api_key": "YOUR_KEY",
    "models": ["gpt-5", "gpt-4o"]
  }],
  "Router": { "default": "openai,gpt-5" }
}
```

### Any OpenAI-Compatible API

```json
{
  "Providers": [{
    "name": "custom",
    "api_base_url": "https://YOUR-API-URL/v1/chat/completions",
    "api_key": "YOUR_KEY",
    "models": ["your-model"]
  }],
  "Router": { "default": "custom,your-model" }
}
```

---

## 📋 Commands

| Command | Description |
|---------|-------------|
| `fcc code` | 🚀 Start coding with Claude |
| `fcc start` | ▶️ Start router server |
| `fcc stop` | ⏹️ Stop router server |
| `fcc status` | 📊 Show server status |
| `fcc model` | 🔄 Switch model interactively |
| `fcc ui` | 🌐 Open web config UI |
| `fcc help` | ❓ Show all commands |

---

## 💰 Save 80% with FreeAIAPIKey.com

<div align="center">

| Model | Official Price | **Our Price** | **You Save** |
|-------|---------------|---------------|--------------|
| GPT-5 | $1.25/1M tokens | **$0.25/1M** | 80% |
| Claude Sonnet 4.5 | $3/1M tokens | **$0.60/1M** | 80% |
| Claude Opus 4.5 | $5/1M tokens | **$1/1M** | 80% |
| Gemini 3 | $2/1M tokens | **$0.40/1M** | 80% |
| DeepSeek V3.2 | $0.50/1M tokens | **$0.20/1M** | 60% |

### 🎁 **Get $2 FREE Credit → [freeaiapikey.com](https://freeaiapikey.com)**

**No credit card required • No rate limits • Instant access**

</div>

---

## 🔧 How It Works

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────────┐
│ Claude Code │ ──► │ Free Claude Code │ ──► │ Your API (80%   │
│   (You)     │     │    (Router)      │     │   cheaper!)     │
└─────────────┘     └──────────────────┘     └─────────────────┘
```

1. You run `fcc code` instead of `claude`
2. Free Claude Code routes requests to YOUR API
3. Works with ANY OpenAI-compatible endpoint
4. Save up to 80% on API costs!

---

## ❓ FAQ

<details>
<summary><b>Why do I need Claude Code v2.0.64?</b></summary>

Claude Code v2.0.64 has the best compatibility with custom API routers. Newer versions may have issues.
</details>

<details>
<summary><b>Can I use any OpenAI-compatible API?</b></summary>

**Yes!** Just set your `api_base_url` and `api_key`. Works with:
- FreeAIAPIKey.com
- DeepSeek
- OpenRouter
- OpenAI
- Gemini
- Groq
- Ollama (local)
- Any custom endpoint
</details>

<details>
<summary><b>How do I switch models?</b></summary>

Inside Claude Code, type:
```
/model provider,model-name
```
Example: `/model freeaiapikey,claude-sonnet-4.5`
</details>

<details>
<summary><b>Is my data safe?</b></summary>

Yes! Free Claude Code runs locally on your machine. Your API key never leaves your computer.
</details>

---

## 🐛 Troubleshooting

### Server won't start

```bash
fcc stop && fcc start
```

### Config file location

- **Windows:** `C:\Users\YOUR_NAME\.free-claude-code\config.json`
- **Mac/Linux:** `~/.free-claude-code/config.json`

### View logs

Logs are stored in `~/.free-claude-code/logs/`

---

## 📦 What's Included

- ✅ **Router Server** - Routes Claude Code to any API
- ✅ **Web UI** - Visual config at `fcc ui`
- ✅ **Model Switcher** - Change models with `fcc model`
- ✅ **Preset System** - Save and share configs
- ✅ **Multiple Providers** - Use different APIs for different tasks

---

## 🤝 Contributing

Contributions welcome! See [GitHub](https://github.com/keepuahead/custom-claude-code).

## 📄 License

MIT License - Use freely!

---

<div align="center">

**Made with ❤️ by [keepuahead](https://github.com/keepuahead)**

**[⬆ Back to Top](#-free-claude-code---easiest-way-to-use-claude-code-with-any-api)**

</div>