FROM node

RUN apt-get update && apt-get install -y htop vim
RUN useradd -m -d /home/mars -s /bin/bash mars
RUN npm install -g bower pm2

USER mars

COPY .bash_profile /home/mars
COPY .bash_aliases /home/mars

ENV SHELL /bin/bash
ENV DBHOST db
ENV DBNAME dev-db
ENV LEVEL silly
ENV PORT 3333

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app
EXPOSE 3333 5858

CMD ["pm2", "start", "process.json", "--no-daemon"]
