FROM node:16-alpine
#FROM remote_js
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent
COPY . .
RUN npm run start

# Install dependencies
RUN apk add --update \
    openssh \
    mc \
    git && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    ssh-keygen -A

#########################################
#
#
#RUN adduser remote_user && \
#    echo "123456" | chpasswd remote_user --stdin && \
#    mkdir /home/remote_user/.ssh && \
#    chmod  700 /home/remote_user/.ssh 


#COPY remote-key.pub  /home/remote_user/.ssh/authorized_keys
#RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
#   chmod  600  /home/remote_user/.ssh/authorized_keys


COPY remote-key.pub  /root/.ssh/authorized_keys
RUN chown root:root -R /root/.ssh/ && \
    chmod  600  /root/.ssh/authorized_keys

RUN ssh-keygen -A

CMD  /usr/sbin/sshd -D 


















 
