FROM deibpolimi/zot

RUN chown root:root /tmp
RUN chmod 1777 /tmp

RUN echo "" > /etc/apt/sources.list
RUN echo "# deb-src http://archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list
RUN echo "# deb-src http://archive.ubuntu.com/ubuntu/ xenial-updates main universe" >> /etc/apt/sources.list
RUN echo "# deb-src http://security.ubuntu.com/ubuntu/ xenial-security main universe" >> /etc/apt/sources.list
RUN echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list
RUN echo "deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ xenial-updates main universe" >> /etc/apt/sources.list
RUN echo "deb [arch=amd64] http://security.ubuntu.com/ubuntu/ xenial-security main universe" >> /etc/apt/sources.list


RUN apt update && apt install -y -q vim
RUN mkdir /home/zot
ADD ./Sources /home/zot/Sources
