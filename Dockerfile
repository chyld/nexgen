FROM node

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update && apt-get install -y mongodb-org htop vim

RUN useradd -m -d /home/mars -s /bin/bash mars
RUN npm install -g pm2

USER mars

COPY .bash_profile /home/mars
COPY .bash_aliases /home/mars

ENV TERM xterm
ENV SHELL /bin/bash
ENV DBHOST db
ENV DBNAME dev-db
ENV LEVEL silly
ENV PORT 3333

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app
EXPOSE 3333 5858

CMD ["pm2", "start", "process.json", "--no-daemon"]
