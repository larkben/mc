FROM itzg/minecraft-server:java21

# Keep secrets/env in Railway or compose, not baked into the image
# (EULA/TYPE/etc can be set there too)

# Bake the mods list so Railway doesn't need a bind mount for it
COPY extras/mods.txt /extras/mods.txt

# Minecraft (TCP/UDP) + RCON
EXPOSE 25565/tcp 25565/udp 25575




