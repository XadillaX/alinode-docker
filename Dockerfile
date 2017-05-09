FROM centos:7

USER root

RUN yum install wget -y
# Change mirrors
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

ENV HOME /root
# Install alinode v2.1.3 (node v6.10.3)
ENV ALINODE_VERSION 2.1.3
ENV TNVM_DIR /root/.tnvm

RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash

RUN source $HOME/.bashrc \
    && tnvm install "alinode-v$ALINODE_VERSION" \
    && tnvm use "alinode-v$ALINODE_VERSION" \
    && npm install -g agentx commandx --registry=https://registry.npm.taobao.org

COPY docker-entrypoint.sh /

COPY agentx.default.js $HOME/

ENTRYPOINT ["/docker-entrypoint.sh"]
