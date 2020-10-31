FROM python:3.7

RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip install -r app/requirements.txt
RUN pwd
RUN ls
RUN ls app/
RUN ls kubernetes/
EXPOSE 5000
CMD ["python", "app/main.py"]
