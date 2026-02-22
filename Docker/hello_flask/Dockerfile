
# Use an official Python runtime as a parent image
FROM python:3.8-slim
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . .
# Install any needed packages specified in requirements.txt
RUN pip install flask
# Make port 5000 available to the world outside this container
EXPOSE 5000
# command to run the application
CMD ["python", "app.py"]

# To build the image, run: docker build -t hello-flask .

# Use this command to run the container: docker run -d -p 5000:5000 hello-flask 