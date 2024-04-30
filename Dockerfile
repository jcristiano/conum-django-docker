# Use a imagem base Python
FROM python:3.11.6

#diretorio de trabalho
WORKDIR /app

# Copie o código-fonte da aplicação para o contêiner
COPY . /app/

# Instale as dependências do projeto
RUN pip3 install --upgrade pip3  && \
        pip install -r requirements.txt

# Exponha a porta em que o Django será executado
EXPOSE 8000

# Execute o comando de inicialização do Django quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]