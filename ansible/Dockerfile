FROM archlinux:base AS base
WORKDIR /usr/local/bin
RUN pacman-key --init
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm base-devel curl git ansible
RUN pacman -Scc --noconfirm
# WORKDIR /tmp/
# RUN git clone https://aur.archlinux.org/adduser.git
# WORKDIR /tmp/adduser
# RUN chmod o+w -R /tmp/adduser
# RUN useradd -m installer
# USER installer
# RUN makepkg -rc
# USER root
# RUN userdel -r installer
# RUN cp adduser /usr/local/bin
# RUN chmod +x /usr/local/bin/adduser
# WORKDIR /tmp/
# RUN rm -R adduser

FROM base AS prime
ARG TAGS
# RUN groupadd --gid 1000 georgian
# RUN adduser georgian --uid 1000 --gid 1000 --disabled-password
# USER georgian
# WORKDIR /home/georgian

FROM prime
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
