#!/bin/bash

# Wait for database to be ready (optional)
# ./wait-for-it.sh db:5432 --timeout=0  # Uncomment this line if you're using wait-for-it.sh

# Run migrations
python manage.py migrate

# Start your application
exec "$@"
