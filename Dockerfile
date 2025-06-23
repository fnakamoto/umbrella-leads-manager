FROM python:3.11-slim

WORKDIR /app

# Copiar requirements primeiro para aproveitar cache do Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código
COPY . .

# Definir variáveis de ambiente
ENV PYTHONPATH=/app
ENV FLASK_ENV=production

# Expor a porta (Railway usa PORT dinamicamente)
EXPOSE $PORT

# Comando para executar a aplicação
CMD ["python", "src/main.py"]

