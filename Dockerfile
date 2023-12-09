FROM python:3.6
ARG MIGRATION=upgrade
WORKDIR /app
# копируем всё
COPY . /app/.
RUN pip install uwsgi
RUN set -ex \
  && pip install --upgrade pip \
  && pip install -r requirements.txt \
  && python --version \
  && pip --version
CMD [ "bash", "-c", "flask db ${MIGRATION} && uwsgi --ini uwsgi.ini" ]
