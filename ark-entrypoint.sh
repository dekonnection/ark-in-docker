#! /bin/bash

exec $ARK_DIR/ShooterGame/Binaries/Linux/ShooterGameServer $MAP?listen?SessionName=$SESSION_NAME?ServerPassword=$JOIN_PASSWORD?ServerAdminPassword=$ADMIN_PASSWORD?Port=$GAME_PORT?QueryPort=$QUERY_PORT?MaxPlayers=$MAX_PLAYERS -server -log -automanagedmods
