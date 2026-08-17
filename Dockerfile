FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1

WORKDIR /app

RUN pip install --no-cache-dir poetry

COPY pyproject.toml poetry.lock /app/

RUN poetry install --no-root --without dev

COPY . /app/

EXPOSE 8000

CMD ["sh", "-c", "python mysite/manage.py migrate && python mysite/manage.py runserver 0.0.0.0:8000"]