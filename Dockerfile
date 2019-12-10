FROM mysql:latest
COPY . .
RUN chmod 777 /setup.sh
RUN /setup.sh