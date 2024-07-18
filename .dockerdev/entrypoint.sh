#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

#bundle exec /mount/bin/dbone.rb

#esto hará fallar el deployment pero igual ingresa los datos
#undle exec /mount/bin/prepara_autorizados.rb

bundle exec /mount/bin/migrate.rb
#bundle exec rake elimina:error_en_type
#bundle exec rake autorizado:*:no_presentada

bundle exec rails s -p 8080 -b 0.0.0.0




