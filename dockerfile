FROM node:20-slim

WORKDIR /app

# 安装系统依赖
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# 安装 uv 和 duckduckgo-mcp-server
RUN pip3 install --break-system-packages uv && \
    uv pip install --system duckduckgo-mcp-server

# 安装 supergateway
RUN npm install -g supergateway

EXPOSE 8000

CMD ["supergateway", "--stdio", "duckduckgo-mcp-server", "--port", "8000"]
