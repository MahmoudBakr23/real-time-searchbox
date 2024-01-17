set -o errexit

npm install
bundle install
rails db:create
rails db:migrate
bundle exec rake assets:precompile
npm run build:css
npm run build