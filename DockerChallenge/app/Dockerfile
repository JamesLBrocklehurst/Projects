# Use an official Python runtime as a parent image
FROM python:3.8-slim
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . .
# Install packages needed to run the application
RUN pip install flask redis
# EXPOSE 5000
EXPOSE 5000
# command to run the application
CMD ["python", "app.py"]