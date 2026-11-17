FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY redirects.conf /etc/nginx/redirects.conf

COPY prod/public/ /srv/warwickspeedrun/prod/public

COPY draft/public/ /srv/warwickspeedrun/draft/public

EXPOSE 80 81
