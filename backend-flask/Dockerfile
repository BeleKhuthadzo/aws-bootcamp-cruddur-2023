FROM 546310198960.dkr.ecr.us-east-1.amazonaws.com/cruddur-python:3.10-slim-buster

# Inside Container - Directory
WORKDIR /backend-flask

# cp the req txt that contains the libraries to run the app from Outside > Inside the container
COPY requirements.txt requirements.txt

# Inside Container - install py lib for the app
RUN pip3 install -r requirements.txt

# cp /backend-flask from Out > In
COPY . .

# Set ENV variables inside the container
ENV FLASK_DEBUG=1

EXPOSE ${PORT}

# Run Flask -module (flask)
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]