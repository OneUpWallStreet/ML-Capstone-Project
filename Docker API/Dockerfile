FROM python:3.8-slim-buster

RUN mkdir -p /MachineLearningAPI

WORKDIR /MachineLearningAPI

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 5000
EXPOSE 80

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]