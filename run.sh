#!/bin/bash


PUBLIC_URL=${PUBLIC_URL:-http://localhost:5000/}
SQLURI=${SQLURI:-sqlite:////tmp/syncserver.db}
SECRET=${SECRET:-INSERT_SECRET_KEY_HERE}
ALLOW_NEW_USERS=${ALLOW_NEW_USERS:-true}
FORCE_WSGI_ENVIRON=${FORCE_WSGI_ENVIRON:-false}

sed -e "s#%%PUBLIC_URL%%#${PUBLIC_URL}#" \
    -e "s#%%SQLURI%%#${SQLURI}#" \
    -e "s#%%SECRET%%#${SECRET}#" \
    -e "s#%%ALLOW_NEW_USERS%%#${ALLOW_NEW_USERS}#" \
    -e "s#%%FORCE_WSGI_ENVIRON%%#${FORCE_WSGI_ENVIRON}#" \
    syncserver.ini.docker > /tmp/syncserver.ini

/home/app/syncserver/local/bin/gunicorn --paste /tmp/syncserver.ini

