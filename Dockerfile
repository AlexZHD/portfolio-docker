FROM python:3.7-alpine
LABEL maintainer www.zmachy.com

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /code
WORKDIR /code
COPY . /code/
# RUN pip install psycopg2
# RUN pip install psycopg2-binary
ADD . /code/

#RUN mkdir -p /vol/web/media
#RUN mkdir -p /vol/web/static
#-D - create user to run app only not having /home dir
#RUN adduser -D user
#RUN chown -R user:user /vol/
#RUN chmod -R 755 /vol/web
#USER user
