# Use a imagem base Python
FROM python:3.12

#diretorio de trabalho
WORKDIR /app

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get clean && \
    update-ca-certificates --fresh

# Copie o código-fonte da aplicação para o contêiner
COPY . /app/

# Instale as dependências do projeto
RUN pip install --upgrade --trusted-host pypi.python.org pip
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Exponha a porta em que o Django será executado
EXPOSE 8000

# Execute o comando de inicialização do Django quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]