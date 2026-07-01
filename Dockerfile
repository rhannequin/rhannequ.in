# syntax=docker/dockerfile:1
# check=error=true

# Static site served by nginx. No build step, no application runtime.
#
#   docker build -t rhannequ_in .
#   docker run -d -p 80:80 --name rhannequ_in rhannequ_in

FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY public/ /usr/share/nginx/html/
COPY index.html styles.css /usr/share/nginx/html/

EXPOSE 80
