# Use a imagem base Python
FROM python:3.9-slim

#diretorio de trabalho
WORKDIR /app

# Copie o código-fonte da aplicação para o contêiner
COPY . /app/

# Instale as dependências do projeto
RUN pip install --upgrade pip && \
        pip install --no-cache-dir -r requirements.txt

# Exponha a porta em que o Django será executado
EXPOSE 8000

# Execute o comando de inicialização do Django quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]