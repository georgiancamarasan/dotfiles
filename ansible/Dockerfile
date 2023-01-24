FROM archlinux:base AS base
WORKDIR /usr/local/bin
RUN pacman-key --init
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm git ansible sudo
RUN pacman -Scc --noconfirm

FROM base AS prime
ARG TAGS
RUN groupadd --gid 1000 georgian
RUN useradd -m --uid 1000 --gid 1000 -G wheel georgian
RUN echo "georgian:pass123" | chpasswd
RUN chown georgian:georgian /home/georgian
USER georgian
WORKDIR /home/georgian/

FROM prime
COPY --chown=georgian:georgian . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
