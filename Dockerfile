FROM cm2network/steamcmd

ARG ARK_DIR_ARG="/home/steam/ark/"
ARG STEAM_GAME_ID=376030

ENV MAP="TheIsland" \
    SESSION_NAME="ark-in-docker" \
    JOIN_PASSWORD="" \
    ADMIN_PASSWORD="" \
    GAME_PORT=7777 \
    RAW_PORT=7778 \
    QUERY_PORT=27015 \
    MAX_PLAYERS=16 \
    ARK_DIR=${ARK_DIR_ARG}

EXPOSE ${GAME_PORT}/udp
EXPOSE ${RAW_PORT}/udp
EXPOSE ${QUERY_PORT}/udp

USER root
RUN apt-get update && apt-get install -y wget

USER steam
RUN mkdir ${ARK_DIR}
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir ${ARK_DIR} +app_update ${STEAM_GAME_ID} +quit

RUN mkdir -p $ARK_DIR_ARG/Engine/Binaries/ThirdParty/SteamCMD/Linux
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd_linux.tar.gz
RUN tar -xf /tmp/steamcmd_linux.tar.gz -C $ARK_DIR_ARG/Engine/Binaries/ThirdParty/SteamCMD/Linux/
RUN ln -s /home/steam/steamcmd/ $ARK_DIR_ARG/Engine/Binaries/ThirdParty/SteamCMD/Linux
RUN ln -s /home/steam/Steam/steamapps/ $ARK_DIR_ARG/Engine/Binaries/ThirdParty/SteamCMD/Linux/steamapps
RUN cd $ARK_DIR_ARG/Engine/Binaries/ThirdParty/SteamCMD/Linux/ && ./steamcmd.sh +quit

COPY ark-entrypoint.sh /ark-entrypoint.sh

WORKDIR $ARK_DIR_ARG/ShooterGame/Binaries/Linux
ENTRYPOINT ["/ark-entrypoint.sh"]
