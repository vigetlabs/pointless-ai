# Pointless AI

This project runs on Rails 7 using some of it's new features.

### Adding JS packages
We use [importmap-rails](https://github.com/rails/importmap-rails) to import JS modules leaning on the Rails asset pipeline

```
bundle exec rails pin <JS_PACKAGE>
```

This will "pin" the JS package to a version string, e.g., `https://ga.jspm.io/npm:react@17.0.2/index.js`. This can be seen under `config/importmap.rb`

### Set up via Docker

```
docker-compose build
docker-compose up
```


