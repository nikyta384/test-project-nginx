FROM nginx:latest
ADD https://github.com/nikyta384/test-project-nginx/blob/main/index.html /usr/share/nginx/html/
RUN chmod +r /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
