FROM nginx:1.15.0-alpine

# because its run default web server
RUN rm /etc/nginx/conf.d/default.conf

COPY ./docker/prod/nginx/nginx.conf /etc/nginx/conf.d