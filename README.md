# README

This project is a very simple app for an internal workshop:
- Rails 5.2
- Vue 3
- PostgreSQL database
- Webpacker

# Dev env
- Install:
```
bundle install
yarn install
```

- Update DB configuration in `config/database.yml`
- Run DB migration `rails db:migrate`

- Run webpack
```
./bin/webpack-watcher
```

- Start rails
```
rails server
```
