FROM python:alpine3.15

RUN pip install --upgrade pip
RUN pip install mkdocs

WORKDIR  /projects
