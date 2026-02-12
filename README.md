# 🚀 Free Claude Code - Use Claude Code with ANY AI Provider

[![npm version](https://badge.fury.io/js/@keepuahead/free-claude-code.svg)](https://badge.fury.io/js/@keepuahead/free-claude-code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/badge/node-%3E%3D20.0.0-brightgreen)](https://nodejs.org/)
[![GitHub Stars](https://img.shields.io/github/stars/keepuahead/custom-claude-code.svg?style=social)](https://github.com/keepuahead/custom-claude-code/stargazers)

> **The easiest way to use Claude Code with any AI provider - DeepSeek, OpenRouter, Gemini, OpenAI, and custom APIs. Save up to 80% on API costs!**

## 🎯 Why Free Claude Code?

- **💰 Save 80-90% on API costs** - Use affordable providers instead of Anthropic directly
- **🔓 No Anthropic account required** - Use any OpenAI-compatible API
- **⚡ Works in 2 minutes** - Simple setup, no complex configuration
- **🤖 All major providers supported** - DeepSeek, OpenRouter, Gemini, OpenAI, and more
- **🔧 Custom provider support** - Works with any OpenAI-compatible API
- **🌐 Web UI included** - Visual configuration management

## 📦 Quick Start (2 Minutes)

### Step 1: Install Claude Code (Specific Version)

```bash
# Install Claude Code version 2.0.64 (required for compatibility)
npm install -g @anthropic-ai/claude-code@2.0.64
```

### Step 2: Install Free Claude Code

```bash
npm install -g @keepuahead/free-claude-code
```

### Step 3: Configure Your Provider

Create a config file at `~/.free-claude-code/config.json`:

```json
{
  "Providers": [
    {
      "name": "freeaiapikey",
      "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
      "api_key": "YOUR_API_KEY",
      "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
    }
  ],
  "Router": {
    "default": "freeaiapikey,gpt-5"
  }
}
```

### Step 4: Run!

```bash
fcc code
```

That's it! You're now using Claude Code with your preferred provider.

## 🌟 Supported Providers

### 1. FreeAIAPIKey.com (Recommended - Save 80%!)

> **Special Offer: Get $2 FREE credit at [freeaiapikey.com](https://freeaiapikey.com)**

Access GPT-5, Claude Opus, Claude Sonnet, Gemini 3, DeepSeek, and more at 80% off!

```json
{
  "name": "freeaiapikey",
  "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
  "api_key": "your-api-key",
  "models": ["gpt-5", "claude-opus-4.5", "claude-sonnet-4.5", "gemini-3", "deepseek-v3.2"]
}
```

### 2. DeepSeek (Budget-Friendly)

```json
{
  "name": "deepseek",
  "api_base_url": "https://api.deepseek.com/chat/completions",
  "api_key": "your-deepseek-api-key",
  "models": ["deepseek-chat", "deepseek-reasoner"],
  "transformer": {
    "use": ["deepseek"],
    "deepseek-chat": {
      "use": ["tooluse"]
    }
  }
}
```

### 3. OpenRouter (Model Aggregator)

```json
{
  "name": "openrouter",
  "api_base_url": "https://openrouter.ai/api/v1/chat/completions",
  "api_key": "your-openrouter-api-key",
  "models": [
    "anthropic/claude-sonnet-4",
    "google/gemini-2.5-pro-preview",
    "deepseek/deepseek-chat"
  ],
  "transformer": {
    "use": ["openrouter"]
  }
}
```

### 4. Google Gemini

```json
{
  "name": "gemini",
  "api_base_url": "https://generativelanguage.googleapis.com/v1beta/models/",
  "api_key": "your-gemini-api-key",
  "models": ["gemini-2.5-flash", "gemini-2.5-pro"],
  "transformer": {
    "use": ["gemini"]
  }
}
```

### 5. OpenAI

```json
{
  "name": "openai",
  "api_base_url": "https://api.openai.com/v1/chat/completions",
  "api_key": "your-openai-api-key",
  "models": ["gpt-5", "gpt-4o", "o1-pro"]
}
```

### 6. Any OpenAI-Compatible API

```json
{
  "name": "custom-provider",
  "api_base_url": "https://your-api-endpoint.com/v1/chat/completions",
  "api_key": "your-api-key",
  "models": ["your-model-name"]
}
```

## 📋 Commands

```bash
fcc start       # Start the router server
fcc stop        # Stop the router server
fcc restart     # Restart the router server
fcc status      # Show server status
fcc code        # Run Claude Code with routing
fcc model       # Interactive model selector
fcc ui          # Open web configuration UI
fcc activate    # Set environment variables
fcc preset      # Manage configuration presets
fcc -v          # Show version
fcc help        # Show help
```

## ⚙️ Configuration

### Basic Configuration

```json
{
  "LOG": true,
  "APIKEY": "optional-security-key",
  "PROXY_URL": "http://127.0.0.1:7890",
  "API_TIMEOUT_MS": 600000,
  "Providers": [
    {
      "name": "provider-name",
      "api_base_url": "https://api.provider.com/v1/chat/completions",
      "api_key": "your-api-key",
      "models": ["model-1", "model-2"]
    }
  ],
  "Router": {
    "default": "provider-name,model-name",
    "background": "provider-name,lightweight-model",
    "think": "provider-name,reasoning-model",
    "longContext": "provider-name,large-context-model",
    "longContextThreshold": 60000
  }
}
```

### Environment Variables

You can use environment variables in your config:

```json
{
  "Providers": [
    {
      "name": "openai",
      "api_base_url": "https://api.openai.com/v1/chat/completions",
      "api_key": "$OPENAI_API_KEY",
      "models": ["gpt-5"]
    }
  ]
}
```

### Router Options

| Option | Description |
|--------|-------------|
| `default` | Default model for all requests |
| `background` | Model for background tasks |
| `think` | Model for reasoning tasks (Plan Mode) |
| `longContext` | Model for large contexts (>60K tokens) |
| `webSearch` | Model for web search tasks |
| `image` | Model for image processing |

### Transformers

Transformers adapt requests for different API formats:

```json
{
  "transformer": {
    "use": ["deepseek"],
    "deepseek-chat": {
      "use": ["tooluse"]
    }
  }
}
```

**Available Transformers:**
- `deepseek` - DeepSeek API format
- `gemini` - Google Gemini format
- `openrouter` - OpenRouter format
- `groq` - Groq API format
- `maxtoken` - Set max tokens
- `tooluse` - Optimize tool usage
- `reasoning` - Handle reasoning content
- `enhancetool` - Error tolerance for tool calls

## 🎨 Web UI

Launch the web-based configuration interface:

```bash
fcc ui
```

This opens a browser interface where you can:
- Configure providers visually
- Manage API keys
- Switch between models
- Create and manage presets

## 💡 Pro Tips

### 1. Switch Models Dynamically

Use `/model` command in Claude Code:

```
/model openrouter,anthropic/claude-sonnet-4
```

### 2. Use Multiple Providers

Configure multiple providers and route different tasks:

```json
{
  "Router": {
    "default": "deepseek,deepseek-chat",
    "think": "openrouter,anthropic/claude-sonnet-4",
    "longContext": "gemini,gemini-2.5-pro"
  }
}
```

### 3. Save Presets

Export your configuration as a preset:

```bash
fcc preset export my-config
```

Install a preset:

```bash
fcc preset install /path/to/preset
```

### 4. Shell Integration

Set environment variables globally:

```bash
eval "$(fcc activate)"
```

Add to your `~/.bashrc` or `~/.zshrc` for persistence.

## 🔧 Troubleshooting

### Claude Code Version Issues

If you encounter compatibility issues, install the specific version:

```bash
npm install -g @anthropic-ai/claude-code@2.0.64
npm install -g @keepuahead/free-claude-code
fcc code  # Run once
npm install -g @anthropic-ai/claude-code
```

### Service Not Starting

Check if the service is running:

```bash
fcc status
```

Restart the service:

```bash
fcc restart
```

### Configuration Errors

Validate your config file:

```bash
fcc ui
```

The UI will show configuration errors and suggestions.

## 🏢 Sponsored by FreeAIAPIKey.com

<div align="center">

### 🎁 Get $2 FREE Credit at [freeaiapikey.com](https://freeaiapikey.com)

**Access GPT-5, Claude, Gemini & More at 80% Off!**

| Model | Official Price | Our Price | You Save |
|-------|---------------|-----------|----------|
| GPT-5 | $1.25/1M in | $0.25/1M in | **80%** |
| Claude Opus 4.5 | $5/1M in | $1/1M in | **80%** |
| Claude Sonnet 4.5 | $3/1M in | $0.60/1M in | **80%** |
| Gemini 3 | $2/1M in | $0.40/1M in | **80%** |
| DeepSeek V3.2 | $0.50/1M in | $0.20/1M in | **60%** |

**No rate limits • No credit card required • GDPR compliant**

</div>

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- Based on [claude-code-router](https://github.com/musistudio/claude-code-router) by musistudio
- Powered by [Claude Code](https://docs.anthropic.com/en/docs/claude-code) by Anthropic

## 📊 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=keepuahead/custom-claude-code&type=Date)](https://star-history.com/#keepuahead/custom-claude-code&Date)

---

<div align="center">

**Made with ❤️ by [keepuahead](https://github.com/keepuahead)**

**[⬆ Back to Top](#-free-claude-code---use-claude-code-with-any-ai-provider)**

</div>

---

## 🔍 SEO Keywords

<details>
<summary>Click to expand keywords</summary>

Free Claude Code, Claude Code Router, Claude Code Alternative, Use Claude Code without Anthropic, Claude Code with DeepSeek, Claude Code with OpenRouter, Claude Code with Gemini, Claude Code Custom Provider, OpenAI Compatible API, Cheap Claude Code, Budget AI Code Assistant, Claude Code Discount, AI Code Assistant Alternative, Claude Code API Gateway, LLM Router for Claude Code, Free AI API, Budget AI Models, GPT-5 API, Claude API Discount, Gemini API Alternative, DeepSeek Claude Code, OpenRouter Claude Code, Custom LLM Provider, AI Code Completion, Developer AI Tools, Indie Hacker AI, Startup AI Optimization, Reduce AI API Costs, AI API Aggregator, Multi-Model API, AI API Gateway.

</details>