FROM ubuntu:17.10

MAINTAINER KENICHI NAITO

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install -y git aria2 curl wget bzip2 vim

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv

COPY files/entry-script.bash /entry-script.bash

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

ENV PATH /root/.pyenv/bin:$PATH
RUN ["/bin/bash", "-c", "source ~/.bashrc && pyenv install anaconda3-5.1.0 && pyenv global anaconda3-5.1.0 && pyenv rehash"]

RUN chmod a+x /entry-script.bash

COPY files/.vimrc /root/.vimrc

CMD ["/entry-script.bash"]
