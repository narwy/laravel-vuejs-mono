#!/usr/bin/env bash

echo "Composer: Update"
composer update

echo "Composer: Dump Autoload"
composer dump-autoload

echo "Laravel: Generating encryption key"
php artisan key:generate

echo "Laravel: Running migrations and seeder"
php /var/www/artisan migrate:fresh --seed --force

echo "Laravel: Running queue worker"
php /var/www/artisan queue:work &

echo "PHP: Starting PHP-FPM"
php-fpm
