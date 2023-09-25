FROM python:alpine

RUN mkdir -p /app/code && \
  cd /app && \
  pip install yamllint && \
  yamllint -h

WORKDIR /app

ENTRYPOINT [ "yamllint" ]
