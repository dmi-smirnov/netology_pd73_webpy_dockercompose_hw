# netology_pd73_webpy_dockercompose_hw

## Сборка образа для контейнера с Django и Gunicorn
Из директории с файлом `Dockerfile` выполнить:
```bash
sudo docker build -t django_crud .
```

## Подготовка файла с переменными окружения
В директории с файлом `docker-compose.yml` создать файл `.env` со следующими переменными окружения:
```
DB_PORT=5432
DB_USER=django_crud
DB_PWD='...'
DB_NAME=django_crud

NGINX_STATIC_ROOT='/var/www/django_crud'

DJANGO_DEBUG=
DJANGO_DATABASE_ENGINE='django.db.backends.postgresql'
DJANGO_SECRET_KEY='...'
DJANGO_STATIC_ROOT=${NGINX_STATIC_ROOT}/static

HTTP_SRV_ADDR_PORT='127.0.0.1:80'
```
`DB_PWD='...'` вместо `...` подставить пароль, который будет использоваться для БД

`DJANGO_SECRET_KEY='...'` вместо `...` подставить SECRET_KEY для приложения

`DJANGO_DEBUG=` для запуска приложения в режиме DEBUG задать любое значение, например, `DJANGO_DEBUG=1`

`HTTP_SRV_ADDR_PORT='127.0.0.1:80'` адрес и порт, по которым будет доступно приложение на хосте

Файл `.env` добавлен в `.gitignore`, так как содержит конфиденциальную информацию.

## Запуск контейнеров для приложения
```bash
sudo docker compose up -d
```