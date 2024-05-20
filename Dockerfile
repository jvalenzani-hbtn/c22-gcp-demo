FROM python:3.12.0-slim-buster

ENV PORT=8080

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY ./app ./

RUN pip install --no-cache-dir -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app