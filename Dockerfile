# Use a imagem base Python
FROM alpine:3.5

#diretorio de trabalho
WORKDIR /app

# Copie o código-fonte da aplicação para o contêiner
COPY . /app/

# Instale as dependências do projeto
RUN pip3 install --upgrade --trusted-host pypi.python.org pip3
RUN pip3 install urllib3==1.23
RUN pip3 install -r requirements.txt

# Exponha a porta em que o Django será executado
EXPOSE 8000

# Execute o comando de inicialização do Django quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]