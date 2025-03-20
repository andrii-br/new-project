FROM python:3.11-alpine

WORKDIR /codapp

COPY ./app/ /codapp/

RUN pip install -r ./codapp/app/requirements.txt

EXPOSE 5000

CMD [ "python", "/cod-app/app/app.py" ]