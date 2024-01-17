set -o errexit

npm install
bundle install
rails db:create
rails db:migrate
npm run build
npm run build:css
