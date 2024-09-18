# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .
COPY * .

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
ENV FLASK_ENV production
# Expose the port your app runs on (change if needed)
EXPOSE 8000
CMD ["gunicorn", "--config", "gunicorn_config.py", "app:app"]

