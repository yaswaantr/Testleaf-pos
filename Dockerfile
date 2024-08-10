# Use an official Node.js image as the base image
FROM node:16

# Install Git and Supervisor
RUN apt-get update && apt-get install -y git supervisor

# Set the working directory in the Docker image
WORKDIR /app

# Clone your GitHub repository into the Docker image
RUN git clone https://github.com/Your-UserName/Testleaf-pos .

# Optionally, specify the branch or commit you want to clone
CMD cd Testleaf-pos
RUN git pull

# Install project dependencies in the root directory and api directory
RUN npm install
WORKDIR /app/api
RUN npm install

# Create a Supervisor configuration file
RUN mkdir -p /etc/supervisor/conf.d
RUN echo "[supervisord]\n\
nodaemon=true\n\
\n\
[program:web]\n\
directory=/app\n\
command=npm run dev:web\n\
autostart=true\n\
autorestart=true\n\
stderr_logfile=/var/log/web.err.log\n\
stdout_logfile=/var/log/web.out.log\n\
\n\
[program:api]\n\
directory=/app/api\n\
command=npm run dev:api\n\
autostart=true\n\
autorestart=true\n\
stderr_logfile=/var/log/api.err.log\n\
stdout_logfile=/var/log/api.out.log\n" > /etc/supervisor/conf.d/supervisord.conf

# Expose the ports that the services will run on
EXPOSE 80 3500

# Start Supervisor to run both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
