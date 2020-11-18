###################################
# multi stage Dockerfile
# 1. build xar archives
# 3. build exist container
###################################

# 1. step

FROM openjdk:8-jdk-stretch as builder
LABEL maintainer="Daniel Röwenstrunk <roewenstrunk@uni-paderborn.de>"

RUN apt-get update && \
    apt-get install -y ant ruby

RUN mkdir -p /sencha && \
    mkdir -p /xars && \
    mkdir -p /edirom && \
    curl -o /sencha/cmd.sh.zip http://cdn.sencha.com/cmd/6.6.0.13/no-jre/SenchaCmd-6.6.0.13-linux-amd64.sh.zip
    
RUN unzip -p /sencha/cmd.sh.zip > /sencha/cmd-install.sh && \
    chmod +x /sencha/cmd-install.sh && \
    /sencha/cmd-install.sh -Dall=true -q -dir /opt/sencha/Cmd

ENV PATH /opt/sencha/Cmd/:$PATH

WORKDIR /edirom

COPY . .

RUN sh build.sh && \
    mv build-xar/*.xar /xars/

# 2. step

FROM stadlerpeter/existdb:latest
LABEL maintainer="Daniel Röwenstrunk <roewenstrunk@uni-paderborn.de>"

ENV EXIST_CONTEXT_PATH /
ENV EXIST_DEFAULT_APP_PATH xmldb:exist:///db/apps/EdiromOnline

COPY --chown=wegajetty --from=builder /xars/*.xar /opt/exist/autodeploy/
ADD --chown=wegajetty ${DATA_PACKAGE_URL} /opt/exist/autodeploy/

