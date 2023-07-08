FROM nginx:alpine3.17
RUN rm -rf /usr/share/nginx/html/*
RUN mkdir -p /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
