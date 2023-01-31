FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port the app will run on
# EXPOSE 8080

ENTRYPOINT ["python", "app.py"]

# Run the command to start the service
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app

# CMD gunicorn --bind :$PORT app:app