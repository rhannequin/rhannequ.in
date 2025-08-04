# [rhannequ.in]

[![CI](https://github.com/rhannequin/rhannequ.in/workflows/CI/badge.svg)](https://github.com/rhannequin/rhannequ.in/actions?query=workflow%3ACI)

Source code for [rhannequ.in].

## Deployment

```
export $(cat .env | xargs) && bin/kamal deploy
```

## Console

```
export $(cat .env | xargs) && bin/kamal app exec -i bin/rails console
```

[rhannequ.in]: https://rhannequ.in
