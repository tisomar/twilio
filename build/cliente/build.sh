#!/bin/bash
if [ -d "/var/www/html/node_modules" ]
 then
    rm -rf node_modules
fi

if [ -d "/var/www/html/dist" ]
then
    echo "Apagando o dist anterior"
    rm -rf dist
fi

mkdir "dist"

echo "Mudando o dono da pasta dist"
chown -R 1000:1000 dist
chmod -R 777 dist
