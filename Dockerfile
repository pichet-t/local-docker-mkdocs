FROM python:alpine3.15

RUN pip install --upgrade pip
RUN pip install mkdocs

ADD entrypoint.sh /docker-entrypoint.sh
WORKDIR  /projects

ENTRYPOINT ["/docker-entrypoint.sh"]