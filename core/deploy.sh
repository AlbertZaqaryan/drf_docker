#!/bin/bash
cd /home/ubuntu/app

# Optional: activate venv
source venv/bin/activate

# Install/update dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Restart gunicorn or other services
sudo systemctl restart gunicorn
