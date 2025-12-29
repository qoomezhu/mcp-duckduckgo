FROM python:3.11-slim

WORKDIR /app

# 安装系统依赖
RUN apt-get update && \
    apt-get install -y git curl && \
    rm -rf /var/lib/apt/lists/*

# 安装 mcp-duckduckgo
RUN pip install --no-cache-dir git+https://github.com/gianlucamazza/mcp-duckduckgo.git

# 安装 supergateway 用于将 STDIO 转为 HTTP
RUN pip install --no-cache-dir supergateway

EXPOSE 3000

# 使用 supergateway 将 STDIO MCP 转换为 SSE HTTP 服务
CMD ["supergateway", "--stdio", "mcp-duckduckgo", "--port", "3000", "--host", "0.0.0.0"]
