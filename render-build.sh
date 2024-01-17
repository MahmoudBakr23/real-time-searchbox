set -o errexit

yarn install
bundle install
rails db:create
rails db:migrate
rails db:seed
npm run build:css
npm run build
bundle exec rake assets:precompile

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:setup
