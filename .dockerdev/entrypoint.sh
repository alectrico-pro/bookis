#esto es para render.com
bundle exec hanami db migrate

echo "bundle install..."
bundle check || bundle install --jobs 4

echo "yarn install..."
yarn install

bundle exec hanami db migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
~
~
~
~
