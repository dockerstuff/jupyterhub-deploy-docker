# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG JUPYTERHUB_VERSION

# FROM jupyterhub/jupyterhub-onbuild:$JUPYTERHUB_VERSION
FROM jupyterhub/jupyterhub:$JUPYTERHUB_VERSION

# Install dockerspawner, oauth, postgres
RUN python3 -m pip install --no-cache --upgrade \
      setuptools \
      pip

RUN python3 -m pip install --no-cache \
      psycopg2-binary==2.9 \
      oauthenticator==15.* \
      dockerspawner==12.*

## Copy TLS certificate and key
#ENV SSL_CERT /srv/jupyterhub/secrets/jupyterhub.crt
#ENV SSL_KEY /srv/jupyterhub/secrets/jupyterhub.key
#COPY ./secrets/*.crt $SSL_CERT
#COPY ./secrets/*.key $SSL_KEY
#RUN chmod 700 /srv/jupyterhub/secrets && \
#    chmod 600 /srv/jupyterhub/secrets/*

# COPY ./userlist /srv/jupyterhub/userlist