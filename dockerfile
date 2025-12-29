FROM python:3.11-slim

WORKDIR /app

# 安装 uv（更快的包管理器）
RUN pip install uv

# 安装 mcp-duckduckgo
RUN uv pip install --system git+https://github.com/gianlucamazza/mcp-duckduckgo.git

# 暴露端口
EXPOSE 3000

# 设置环境变量
ENV MCP_PORT=3000

# 启动命令
CMD ["mcp-duckduckgo", "--port", "3000"]
