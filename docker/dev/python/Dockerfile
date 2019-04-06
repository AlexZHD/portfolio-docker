FROM python:3.7-alpine
LABEL maintainer www.zmachy.com

ENV PYTHONUNBUFFERED 1

COPY requirements/base.txt /base.txt
COPY requirements/dev.txt /dev.txt
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install -r dev.txt
RUN apk del .tmp-build-deps

RUN mkdir /code
WORKDIR /code
COPY . /code/

ADD . /code/

#-p, --parents
#no error if existing, make parent directories as needed
RUN mkdir -p /code/media
RUN mkdir -p /code/static
#-D - create user to run app only not having /home dir
RUN adduser -D user
RUN chown -R user:user /code/
RUN chmod -R 755 /code/media
RUN chmod -R 755 /code/static
RUN chmod +x /code/entrypoint.sh
USER user
