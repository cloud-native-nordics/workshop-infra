#!/bin/bash

PUBLISHER=$1
PACKAGE=$2
VERSION=$3
URL="https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${PUBLISHER}/vsextensions/${PACKAGE}/${VERSION}/vspackage"
DIR="/root/.local/share/code-server/extensions/${PUBLISHER}.${PACKAGE}-${VERSION}"

cd /tmp && rm -rf extension && curl -sSLJ ${URL} | bsdtar -xv -f- extension && mv extension ${DIR}
