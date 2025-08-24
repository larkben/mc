FROM itzg/minecraft-server:java21

# Keep secrets/env in Railway or compose, not baked into the image
# (EULA/TYPE/etc can be set there too)

ENV EULA=TRUE \
    TYPE=FABRIC \
    VERSION=1.21.1 \
    MEMORY=4G \
    MODS_FILE=/extras/mods.txt \
    REMOVE_OLD_MODS=TRUE \
    TZ=America/Chicago \
    USE_AIKAR_FLAGS=TRUE \
    ENABLE_AUTOSTOP=TRUE \
    AUTOSTOP_TIMEOUT_EST=300 \
    AUTOSTOP_TIMEOUT_INIT=480 \
    AUTOSTOP_PERIOD=10 \
    ENABLE_QUERY=TRUE \
    ENABLE_RCON=TRUE \
    RCON_PASSWORD=changeme \
    RCON_PORT=25575

# Bake the mods list so Railway doesn't need a bind mount for it
COPY extras/mods.txt /extras/mods.txt

# Minecraft (TCP/UDP) + RCON
EXPOSE 25565/tcp 25565/udp 25575




