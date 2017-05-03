FROM centos:7

USER root

RUN yum install wget -y
# Change mirrors
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

ENV HOME /root
ENV ALINODE_VERSION 2.1.2
ENV TNVM_DIR /root/.tnvm

# Install alinode v2.1.2 (node v6.10.2)
RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash

RUN source $HOME/.bashrc \
    && tnvm install "alinode-v$ALINODE_VERSION" \
    && tnvm use "alinode-v$ALINODE_VERSION" \
    && npm install -g agentx commandx --registry=https://registry.npm.taobao.org

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
