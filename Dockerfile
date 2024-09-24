FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory
COPY . /app

# Install packages in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 4000

# Define environment variable sqlite3
ENV DATABASE_URL=sqlite:///./test.db

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "4000"]
