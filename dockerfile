FROM itzg/minecraft-server:java17

# ---- Base settings (override in Railway env if you want) ----
ENV EULA=TRUE \
    TYPE=FABRIC \
    VERSION=1.20.1 \
    MEMORY=4G \
    TZ=America/Chicago \
    ENABLE_RCON=true \
    RCON_PASSWORD=changeme \
    RCON_PORT=25575 \
    ONLINE_MODE=true

# Mods management: point container at a text file of URLs
# (the actual jars will be downloaded into the mounted /data volume)
COPY mods.txt /extras/mods.txt
ENV MODS_FILE=/extras/mods.txt
# Clean out old jars on deploy so your mods list is the authority
ENV REMOVE_OLD_MODS=TRUE

