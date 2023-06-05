FROM alpine:3.15.4

RUN apk add --no-cache \
    git \
    vim \
    curl \
    tar \
    yq \
    jq \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
RUN echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

WORKDIR /root
ENTRYPOINT /bin/zsh