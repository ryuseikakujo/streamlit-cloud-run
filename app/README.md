# Streamlit App

## Environment Variable

Yo need to set up `VAR1` and `VAR2` for environment variables for

```bash
$ export VAR1=hoge
$ export VAR2=fuga
```

## Run Streamlit Locally

```bash
$ python -m venv .venv
$ . .venv/bin/activate
$ pip install --upgrade pip
$ pip install poetry
$ poetry install
$ streamlit run main.py
```

Open `http://localhost:8080` then you will see your streamlit app.

## Run Streamit on Docker

```bash
$ docker compose up -d
```

Open `http://localhost:8080` then you will see your streamlit app.

To stop docker:

```bash
$ docker compose down
```
