FROM python:3.11-alpine as base

# Prevent buffering and send stdout/stderr streams directly to terminal so we can see them:
ENV PYTHONUNBUFFERED 1 
# Don't litter .pyc files everywhere; they generate fast enough anyway we don't need to opitimize:
ENV PYTHONDONTWRITEBYTECODE 1

# Set working directory for container:
WORKDIR /app/backend
COPY requirements.txt /app/backend/

# Build psycopg2-binary from source -- add required required dependencies
RUN apk add --virtual .build-deps --no-cache postgresql-dev gcc python3-dev musl-dev && \
        pip install --no-cache-dir -r requirements.txt && \
        apk --purge del .build-deps

COPY . /app/backend/

# We have to listen on 0.0.0.0 (all addresses) in order to let docker discover this service:
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]