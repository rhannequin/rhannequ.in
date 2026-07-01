# [rhannequ.in]

Source for [rhannequ.in].

## Content

Edit `index.html` and `styles.css`.

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