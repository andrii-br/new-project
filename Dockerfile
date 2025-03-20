FROM python:3.11-alpine

WORKDIR /cod-app

COPY ./app/ /cod-app/

COPY ./app/requirements.txt /cod-app/

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "python", "/cod-app/app/app.py" ]