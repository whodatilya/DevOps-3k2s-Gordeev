# Базовый образ для веб-сервера
FROM nginx:latest

# Метаданные об авторе и контактах
MAINTAINER Gordeev Ilya <back22019@yandex.ru>

# Обновление списка пакетов и установка необходимых
RUN apt-get update && apt-get install -y postgresql postgresql-contrib nginx-extras

# Копирование конфигурационных файлов Nginx
ADD nginx.conf /etc/nginx/nginx.conf

# Копирование конфигурационных файлов PostgreSQL
COPY pg_hba.conf /etc/postgresql/13/main/pg_hba.conf

# Установка рабочей директории
WORKDIR /usr/share/nginx/html

# Установка переменных окружения
ENV POSTGRES_PASSWORD=postgres_password

# Копирование файлов в контейнер
COPY index.html /usr/share/nginx/html/index.html

# Создание объема для хранения данных БД
VOLUME /var/lib/postgresql/13/main

# Установка пользователя
USER nginx

# Открытие портов
EXPOSE 80 5432

# Запуск команды при запуске контейнера
CMD ["nginx", "-g", "daemon off;"]
