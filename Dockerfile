FROM python:3.11-alpine

WORKDIR /cod-app

COPY ./app /cod-app/app
COPY requirements.txt /cod-app/

RUN pip install --no-cache-dir -r /cod-app/requirements.txt

EXPOSE 5000

CMD ["python", "/cod-app/app/app.py"]
