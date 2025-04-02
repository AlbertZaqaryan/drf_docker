#!/bin/bash
cd /home/ec2-user/app || exit 1

# Активировать виртуальное окружение, если оно есть
source venv/bin/activate 2>/dev/null || echo "No venv found"

# Установка зависимостей
pip install -r requirements.txt

# Миграции
python manage.py migrate

# Собрать статику
python manage.py collectstatic --noinput

# Перезапуск gunicorn
sudo systemctl restart gunicorn
