###################################
# multi stage Dockerfile
# 1. build xar archives
# 3. build exist container
###################################

# 1. step

FROM ghcr.io/bwbohl/sencha-cmd:2.1.0 AS builder
LABEL maintainer="Daniel Röwenstrunk <roewenstrunk@uni-paderborn.de>"

WORKDIR /edirom

COPY . .

# adapted from `build.sh` since the original script was not working here
RUN /opt/Sencha/Cmd/sencha ant clean \
    && /opt/Sencha/Cmd/sencha app build \
    && rm -rf build/temp \
    && ant build-plus \
    && ant -f build/build.xml

# 2. step

FROM stadlerpeter/existdb:5
LABEL maintainer="Daniel Röwenstrunk <roewenstrunk@uni-paderborn.de>"

ARG DATA_PACKAGE_URL="https://github.com/Detmolder-Hoftheater/EdiromOnlineHoftheater/releases/download/v1.0.0/theater-data.xar"

ENV EXIST_CONTEXT_PATH="/"
ENV EXIST_DEFAULT_APP_PATH="xmldb:exist:///db/apps/EdiromOnline"

COPY --chown=wegajetty --from=builder /edirom/build-xar/*.xar /opt/exist/autodeploy/
ADD --chown=wegajetty ${DATA_PACKAGE_URL} /opt/exist/autodeploy/
