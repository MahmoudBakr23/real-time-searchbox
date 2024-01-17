set -o errexit

yarn install
bundle install
rails db:create
rails db:migrate
npm run build:css
npm run build
bundle exec rake assets:precompile