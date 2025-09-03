FROM itzg/minecraft-server:java21

# Keep secrets/env in Railway or compose, not baked into the image
# (EULA/TYPE/etc can be set there too)

ENV EULA=TRUE \
    TYPE=FABRIC \
    VERSION=1.21.1 \
    MEMORY=6G \
    MODS_FILE=/extras/mods.txt \
    REMOVE_OLD_MODS=TRUE \
    TZ=America/Chicago \
    USE_AIKAR_FLAGS=TRUE \
    ENABLE_QUERY=TRUE \
    ENABLE_RCON=TRUE \
    RCON_PASSWORD=changeme \
    RCON_PORT=25575 \
    ALLOW_FLIGHT=TRUE \
    JVM_OPTS="-Dfml.readTimeout=90 -Djava.net.preferIPv4Stack=true" \
    ENABLE_TCP_KEEPALIVE="true"

# tiny wrapper that runs the server AND a conditional keep-alive loop
COPY keepalive.sh /usr/local/bin/keepalive.sh
RUN chmod +x /usr/local/bin/keepalive.sh

# run wrapper (which starts /start and the loop)
CMD ["/usr/local/bin/keepalive.sh"]

# optional: bake your mods list
# COPY extras/mods.txt /extras/mods.txt

# Bake the mods list so Railway doesn't need a bind mount for it
COPY extras/mods.txt /extras/mods.txt

# Minecraft (TCP/UDP) + RCON
EXPOSE 25565/tcp 25565/udp 25575




