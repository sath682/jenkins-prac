FROM nginx:1.18
RUN echo "Hello from Jenkins" > /usr/share/nginx/html/index.html
