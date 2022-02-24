FROM python:latest
WORKDIR /usr/src/backapp
COPY server.py requirements.txt ./
RUN pip install -r requirements.txt
ENV USER_NAME=TestUser
EXPOSE 5000
CMD ["python", "server.py"]
