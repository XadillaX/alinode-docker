FROM buildpack-deps:xenial

USER root

ENV ALINODE_VERSION 1.5.2
ENV HOME /root
ENV TNVM_DIR /root/.tnvm

RUN mv /bin/sh /bin/sh_ && ln -s /bin/bash /bin/sh

# Install alinode v1.5.2 (node 4.4.0)
RUN mkdir /tmp/node_log
RUN wget -qO- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash
RUN . $TNVM_DIR/tnvm.sh && \
    tnvm install "alinode-v$ALINODE_VERSION"
RUN . $TNVM_DIR/tnvm.sh && \
    tnvm use "alinode-v$ALINODE_VERSION"
RUN . $TNVM_DIR/tnvm.sh && \
    npm install -g agentx
RUN git clone https://github.com/aliyun-node/commands.git /usr/local/src/alinode_commands

RUN rm /bin/sh && mv /bin/sh_ /bin/sh

COPY docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]
