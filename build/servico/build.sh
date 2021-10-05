#!/bin/bash
echo "Back - Iniciando o Endpoint da Aplicação"

if ! [ -f ".env" ]; then
    echo "Arquivo '.env' não encontrado - Gerando arquivo"
    cp env.dev-local .env
fi

echo "Instalando as dependências com o composer..."
php -d memory_limit=-1 /usr/local/bin/composer install

echo "Permissões de acesso a pasta vendor"
chmod -R 777 vendor

echo "Alterando o timeout de mail"
sed -i "s/'timeout' => 30/'timeout' => 300/g" vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php

echo "Permissões de acesso a pasta storage"
chmod -R 777 storage

#echo "DB Migration"
#php artisan migrate --force

echo "Limpando o cache das rotas e views"
php artisan view:clear

echo "Configurando o cache da aplicação"
php artisan key:generate
php artisan config:cache

echo "Back - Finzalizando o Endpoint da Application"