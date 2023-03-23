# Pointless AI

This project runs on Rails 7 using some of it's new features.

### Set up via Docker

```
docker-compose build
docker-compose up
```

### Seeding

```
rake db:seed
```

### Testing

We use [rspec-rails](https://github.com/rspec/rspec-rails) and [factory-bot](https://github.com/thoughtbot/factory_bot)

In order to run tests:

```
docker compose exec backend rake db:create
docker compose exec backend bundle exec rspec
```

### Frontend

- JS packages [importmap-rails](https://github.com/rails/importmap-rails)
- CSS [cssbundling-rails](https://github.com/rails/cssbundling-rails)

**Adding a JS package:**

```
bundle exec rails pin <JS_PACKAGE>
```

This will "pin" the JS package to a version string, e.g., installing react will yield `https://ga.jspm.io/npm:react@17.0.2/index.js`. This can be seen under `config/importmap.rb`

In order to get Tailwind to run and compile, have another terminal open running `yarn build:css --watch`

### Adding credentials

Adding credentials to the `credentials.yml.enc` file
1. Run rails `credentials:edit`
2. Add your secrets
3. Save and quit. This will encrypt the file.
