FROM python

RUN mkdir -p /app/code
RUN cd /app
RUN pip install yamllint
RUN yamllint -h

WORKDIR /app

ENTRYPOINT [ "yamllint" ]
