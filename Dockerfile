FROM codercom/code-server

RUN sudo apt-get update
RUN sudo apt-get install -y apt-utils
RUN sudo apt-get install -y build-essential
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y git
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm install -g npm@latest
RUN sudo npm install -g pm2
RUN sudo pm2 install pm2-logrotate
RUN sudo pm2 set pm2-logrotate:max_size 101M


RUN sudo npm install -g ionic@5.4.16
RUN sudo npm install -g cordova@9.0.0
RUN sudo npm install -g git-upload
RUN sudo npm install -g @angular/cli@9.0.3
RUN sudo npm i -g cordova-res@0.5.1 --unsafe-perm
RUN sudo npm install typescript -g
RUN tsc --version

USER root

RUN mkdir -p /home/project \
  && mkdir -p /home/.local/share/code-server

WORKDIR /home/project
VOLUME [ "/home/project" ]

EXPOSE 8080

ENTRYPOINT ["dumb-init", "code-server", "--host", "0.0.0.0"]