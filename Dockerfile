FROM nginx:alpine

WORKDIR /app

RUN apk --no-cache add gcc libffi-dev musl-dev openssl-dev \
  python3 python3-dev py-pip build-base

COPY Pipfile /app/Pipfile

RUN python3 -m pip install -U pip

RUN python3 -m pip install pipenv --user

RUN pipenv install

COPY ./msa-docs/ /app/

RUN mkdocs build

RUN cp -r /app/site/* /usr/share/nginx/html