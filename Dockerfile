FROM python:3.6
ARG MIGRATION=upgrade
LABEL maintainer="Egor"
WORKDIR /app
# копируем всё
COPY . /app/.
RUN set -ex \
  &&  pip install --no-cache-dir uwsgi \
  && pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt \
  && python --version \
  && pip --version
CMD [ "bash", "-c", "flask db ${MIGRATION} && uwsgi --ini uwsgi.ini" ]
#950,43 mb до переноса после переноса 947.74 дальше --no-cache-dir добавим и получим 935.22 mb на винде