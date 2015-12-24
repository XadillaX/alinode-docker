FROM centos:7

USER root

# Change mirrors
RUN yum install wget -y
# RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
# RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# Install required software
RUN yum install curl git python tree gcc gcc-c++ make openssl-devel -y

ENV HOME /root
ENV ALINODE_VERSION 1.2.2
ENV TNVM_DIR /root/.tnvm
RUN mkdir /tmp/node_log

# Install alinode v1.1.0 (node 4.2.2)
RUN wget -qO- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash 
RUN source $HOME/.bashrc && \
        tnvm install "alinode-v$ALINODE_VERSION" && \
        tnvm use "alinode-v$ALINODE_VERSION" 
RUN source $HOME/.bashrc && npm install -g agentx
RUN git clone https://github.com/aliyun-node/commands.git /usr/local/src/alinode_commands

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
