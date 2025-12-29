FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir git+https://github.com/gianlucamazza/mcp-duckduckgo.git

EXPOSE 3000

ENV MCP_PORT=3000

CMD ["mcp-duckduckgo", "--port", "3000"]
