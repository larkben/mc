FROM itzg/minecraft-server:java21

ENV EULA=TRUE \
    TYPE=FABRIC \
    VERSION=1.21.1 \
    MEMORY=4G \
    MODS_FILE=/extras/mods.txt \
    REMOVE_OLD_MODS=TRUE

# Bake mods list into the image so Railway doesn’t need a bind mount
COPY extras/mods.txt /extras/mods.txt

EXPOSE 25565


