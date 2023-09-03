FROM python:3.10-buster AS app-stage

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# # Collect static files
# RUN python manage.py collectstatic --noinput

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Run server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


FROM nginx AS nginx-stage

COPY andrepreira.ddns.net.conf /etc/nginx/nginx.conf

FROM postgres:14 As pg-stage