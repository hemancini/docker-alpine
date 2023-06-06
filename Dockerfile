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

# install oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN echo -e "\nsource /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc
RUN echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc

# change theme to fwalch
RUN sed -i 's/ZSH_THEME=.*/ZSH_THEME="fwalch"/g' ~/.zshrc

# isntall zsh-sytem-information plugin
RUN git clone https://github.com/hemancini/zsh-sytem-information.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-sytem-information
RUN sed -i 's/plugins=(/plugins=(zsh-sytem-information /g' ~/.zshrc

WORKDIR /root
ENTRYPOINT /bin/zsh
