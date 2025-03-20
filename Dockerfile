FROM python:3.11-alpine

WORKDIR /codapp

COPY ./app/ /codapp/

COPY app/requirements.txt codapp/requirements.txt
RUN pip install -r codapp/requirements.txt

EXPOSE 5000

CMD [ "python", "/codapp/app/app.py" ]