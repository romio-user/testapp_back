FROM python:latest
WORKDIR /usr/src/backapp
COPY . .
RUN pip install -r requirements.txt
ENV USER_NAME=Test_user
EXPOSE 5000
CMD ["python", "server.py"]
