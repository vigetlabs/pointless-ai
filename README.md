# Pointless AI

This project runs on Rails 7 using some of it's new features.

### Set up via Docker

```
docker-compose build
docker-compose up
```

### Testing

We use [rspec-rails](https://github.com/rspec/rspec-rails) and [factory-bot](https://github.com/thoughtbot/factory_bot)

In order to run tests:

```
docker compose exec backend rake db:create
docker compose exec backend bundle exec rspec
```
