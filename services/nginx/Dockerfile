FROM nginx:1.17-alpine as base

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

FROM base as traefik

RUN rm /etc/nginx/conf.d/nginx.conf
COPY nginx.traefik.conf /etc/nginx/conf.d