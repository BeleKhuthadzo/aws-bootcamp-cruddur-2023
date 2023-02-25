# Week 1 — App Containerization
A challenging and yet fulfilling week 1, here is how it went down:

## Containerized the Backend
### Add Dockerfile
I followed week 1 instructions to add a Dockerfile within the backend application and added the below docker configurations of how the application will run: <br>
```
FROM python:3.10-slim-buster

# Inside Container - Directory
WORKDIR /backend-flask

# cp the req txt that contains the libraries to run the app from Outside > Inside the container
COPY requirements.txt requirements.txt

# Inside Container - install py lib for the app
RUN pip3 install -r requirements.txt

# cp /backend-flask from Out > In
COPY . .

# Set ENV variables inside the container
ENV FLASK_ENV=development

EXPOSE ${PORT}

# Run Flask -module (flask)
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]
```
### Run Flask
Within the backend-flask directory, i ran the below python script to install flask module locally, open port 4567 and set BACKEND_URL and FRONTEND_URL envars:<br>
```
cd backend-flask
export FRONTEND_URL="*"
export BACKEND_URL="*"
python3 -m flask run --host=0.0.0.0 --port=4567
cd ..
```
### Build a Container
First i unset the FRONTEND/BACKEND envars which i'd set above and then ran the command below to build the container: <br>
```
# -t (tags the docker image with "latest" default tag if tag unspecified)
docker build -t  backend-flask ./backend-flask
```
### Run Container
Run Command
```
# -e (injests enviroment variables)
docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
```

### Get Frontend/Backend Container Images with (docker ps/ps -a)
![Container Images](assets/ps-ps-a.png)
