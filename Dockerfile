FROM buildpack-deps:jessie

USER root

ENV HOME /root
ENV ALINODE_VERSION 1.5.2
ENV TNVM_DIR /root/.tnvm
RUN mkdir /tmp/node_log

# Install alinode v1.5.2 (node 4.4.0)
RUN wget -qO- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash 
RUN /bin/bash -c "source $HOME/.bashrc && \
        tnvm install 'alinode-v$ALINODE_VERSION' && \
        tnvm use 'alinode-v$ALINODE_VERSION'" 
RUN /bin/bash -c "source $HOME/.bashrc && npm install -g agentx"
RUN git clone https://github.com/aliyun-node/commands.git /usr/local/src/alinode_commands

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
