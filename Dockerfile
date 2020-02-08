FROM ubuntu:latest
LABEL maintainer="Tristan RENAUD <renaud.devuser@free.fr>"

RUN apt-get update && \
    apt-get install -y sudo curl git-core gnupg locales nodejs zsh wget nano nodejs npm fonts-powerline vim ttf-ancient-fonts default-jre && \
    locale-gen fr_FR.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:p@ssword1" | chpasswd &&  usermod -aG sudo devuser

ADD --chown=devuser:devuser scripts/p10k.zsh /home/devuser/.p10k.zsh
RUN chmod u+x /home/devuser/.p10k.zsh

USER devuser
ENV TERM xterm
ENV ZSH_THEME powerlevel10k/powerlevel10k
RUN cd /home/devuser && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k && \
    mv .zshrc .zshrc_orig
ADD --chown=devuser:devuser scripts/zshrc_devuser /home/devuser/.zshrc

WORKDIR /home/devuser/
RUN mkdir development

CMD ["zsh"]
