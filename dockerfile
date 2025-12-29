FROM node:20-slim

WORKDIR /app

# 安装 Python
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# 直接用 pip 安装 duckduckgo-mcp-server
RUN pip3 install --break-system-packages duckduckgo-mcp-server

# 安装 supergateway
RUN npm install -g supergateway

EXPOSE 8000

CMD ["supergateway", "--stdio", "duckduckgo-mcp-server", "--port", "8000"]
