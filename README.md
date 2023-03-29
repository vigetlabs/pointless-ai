# Pointless AI

This project runs on Rails 7 using some of it's new features.

### Getting started

Copy over the configuration example: `cp ./.docker/backend/.env.example ./.docker/backend/.env`.

Pointy leans on the OpenAI API. Head on over to [OpenAI](https://platform.openai.com/) to yoink your access token or generate one. Once you have it, place it under the `OPENAI_SECRET_TOKEN` entry in the `.env` you copied earlier.

You should now be ready to bring the project up and get started! Run:

```
docker-compose build
docker-compose up
```

This should bring everything up and seed the database with a test user.

```
test@test.com
password
```

### Testing

Run `docker compose exec backend bundle exec rspec`

### Frontend

- JS packages [importmap-rails](https://github.com/rails/importmap-rails)
- CSS [cssbundling-rails](https://github.com/rails/cssbundling-rails)

**Adding a JS package:**

```
docker compose exec backend bundle exec rails pin <JS_PACKAGE>
```

This will "pin" the JS package to a version string, e.g., installing react will yield `https://ga.jspm.io/npm:react@17.0.2/index.js`. This can be seen under `config/importmap.rb`

In order to get Tailwind to run and compile, have another terminal open running `yarn build:css --watch`
