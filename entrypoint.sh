#!/bin/bash
sleep 2

cd /home/container

if [ "${UMOD_AUTOUPDATE}" == "1" ]; then
    curl -sSL https://umod.io/umod-develop.sh | bash /dev/stdin
    source ~/.profile
fi

if [ "${GAME_AUTOUPDATE}" == "1" ]; then
    umod install valheim -P
    umod new launcher -P
fi

MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

${MODIFIED_STARTUP}