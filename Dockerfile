from node:16-bullseye

WORKDIR /app

RUN yarn global add @vue/cli @vue/cli-service

# User setup
COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc
ENV HOME=/app
ARG user
ARG uid
ARG gid
RUN userdel node && \
    groupadd -g $gid $user && \ 
    useradd --shell /bin/bash -u $uid -g $gid $user

CMD ["bash"]
