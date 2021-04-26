FROM bitwardenrs/server:latest

# apk 加速
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# RUN apk add mysql-client
# RUN cd /tmp
# RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.17-1_all.deb
# RUN sudo dpkg -i mysql-apt-config*
# RUN sudo apt update
# RUN sudo apt install mysql-server

# RUN apt-get update && apt-get install -y mysql-client
RUN apt-get update && echo 'y' | apt install mariadb-client

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["/start.sh"]

