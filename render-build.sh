set -o errexit

bundle install
rails db:create
rails db:migrate
npm run build
npm run build:css
