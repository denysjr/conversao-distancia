#definir a imagem padrao
FROM python
# o diretorio padrao ou home do usuário. e também ao acessar o container ja vamos entrar nesse diretorio.
WORKDIR /app
# copiar arquivos de dentro para fora. o "." vai salvar o arquivo no diretorio padrao, definido no workdir
COPY requirements.txt .

#comando run, para executar comandos. "pip" é uma sintaxe do python
RUN pip install -r requirements.txt

#copiar o restante dos arquivos da pasta para dentro do container.
COPY . /app/
RUN apt update
#para abrir a porta de acesso, para acesso via web
EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
