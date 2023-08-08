## README

## Getting started

1.) `docker-compose build`
2.) `docker-compose up -d`

- Python Djando web server should be running at http://localhost:8000/
- Vite + React with TS should be avilable at http://localhost:5173/

### Troubleshooting

- Make sure you run commands with the correct permissions. (e.g. may need to sure with `sudo`)
- If you're getting a "port is already allocated" error:
  - Make sure services aren't already running. E.g. run `docker-compose down`
  - Make sure you don't have any other docker containers running that use the port:
    - `sudo docker container ls` 
    - `sudo docker stop [CONTAINER ID]`

## Notes

How I made this:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install django djangorestframework django-cors-headers psycopg2-binary
django-admin startproject backend
pip freeze > requirements.txt
touch gitignore
code gitignore

.venv/
backend/backend/__pycache__/
backend/db.sqlite3

git init
git add .
git commit -m "Backend"

npm create vite@latest frontend --template react-ts
```

_Select:_
 - `(y)`
 - `React`
 - `Typescript + SWC`

```bash
cd frontend
npm install
npm run dev
```

Validate it works; Ctrl + C

```bash
cd ../
git add .
git commit -m "Front end"
```

Then I created the actual containerization; see git history.


### References

https://dev.to/anjalbam/dockerize-a-django-react-and-postgres-application-with-docker-and-docker-compose-by-anjal-bam-e0a


