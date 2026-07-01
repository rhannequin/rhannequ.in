# [rhannequ.in]

Source for [rhannequ.in].

## Content

Edit `public/index.html` and `public/styles.css`.

## Preview locally

Serve the `public/` directory:

```
bin/dev
```

Then open http://localhost:8000. Pass a port to override: `bin/dev 4000`.

## Deployment

Requires Kamal installed locally (`gem install kamal`) and Docker running.

```
export $(cat .env | xargs) && kamal deploy
```

Logs:

```
export $(cat .env | xargs) && kamal logs
```

[rhannequ.in]: https://rhannequ.in
[Kamal 2]: https://kamal-deploy.org
