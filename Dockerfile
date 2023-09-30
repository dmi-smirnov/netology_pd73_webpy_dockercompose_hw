FROM python:3.10.12

WORKDIR /usr/src/app

COPY ./netology_pd_django_hw_3.2_crud .
RUN pip install -r requirements.txt

CMD python manage.py makemigrations logistic; \
    python manage.py migrate; \
    python manage.py collectstatic --noinput; \
    gunicorn stocks_products.wsgi -b 0.0.0.0:80