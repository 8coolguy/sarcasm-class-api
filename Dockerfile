# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port your app runs on (change if needed)
EXPOSE 8000

# Set environment variables to ensure Python runs in an expected way
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Run the application (assuming your main file is app.py, adjust as necessary)
CMD ["python", "app.py"]
