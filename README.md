# Quote-MCP Pipeline Automation

This project automates your Quote-MCP flow against  
**http://172.188.80.68/mcp1** via both:

- **GitHub Actions** (3 staggered workflows under `.github/workflows/`)
- **Shell script + cron** (`scripts/run_quote_mcp.sh`)

## Setup

1. **Cron** (on your server):
   ```bash
   crontab -e
   # e.g. run every day at 2 AM
   0 2 * * * /full/path/to/scripts/run_quote_mcp.sh
