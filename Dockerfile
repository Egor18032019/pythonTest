FROM python:3.6

WORKDIR /app

# копируем всё
COPY . /app/.

RUN pip install uwsgi


RUN set -ex \
  && pip install --upgrade pip \
  && pip install -r requirements.txt \
  && python --version \
  && pip --version
