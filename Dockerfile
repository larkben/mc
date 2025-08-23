FROM itzg/minecraft-server:java21

# Core server config
ENV EULA=TRUE \
    TYPE=FABRIC \
    VERSION=1.21.1 \
    MEMORY=4G \
    MODS_FILE=/extras/mods.txt \
    REMOVE_OLD_MODS=TRUE \
    TZ=America/Chicago \
    USE_AIKAR_FLAGS=TRUE

# Graceful idle shutdown BEFORE Railway’s 10-minute sleep window
# (prevents progress loss)
ENV ENABLE_AUTOSTOP=TRUE \
    AUTOSTOP_TIMEOUT_EST=480 \
    AUTOSTOP_TIMEOUT_INIT=600 \
    AUTOSTOP_PERIOD=10 \             
    ENABLE_QUERY=TRUE

# Optional: RCON so you can force saves, etc.
ENV ENABLE_RCON=TRUE \
    RCON_PASSWORD=changeme \
    RCON_PORT=25575

# Bake mods list into the image so Railway doesn’t need a bind mount
COPY extras/mods.txt /extras/mods.txt

# Expose Minecraft (TCP/UDP) + RCON
EXPOSE 25565/tcp 25565/udp 25575


