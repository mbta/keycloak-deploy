FROM quay.io/keycloak/keycloak:24.0.5 as builder

LABEL maintainer="support@integrationeye.com"
LABEL builder="Integsoft s.r.o"
LABEL description="MBTA Keycloak"

ENV INSTALL_FOLDER=/tmp/files
ENV KC_FOLDER=/opt/keycloak

ENV KC_DB=mariadb
ENV KC_HTTP_RELATIVE_PATH=/auth
ENV KC_CACHE_CONFIG_FILE=cache-ispn-jdbc-ping.xml
ENV KC_HOSTNAME_STRICT=false
ENV KC_HTTP_ENABLED=true
ENV KC_LOG_LEVEL=INFO,cz.integsoft:debug
ENV KC_PROXY=edge
ENV KC_HEALTH_ENABLED=true

USER keycloak

# copy build scripts and related data
COPY files/ $INSTALL_FOLDER/

# copy the custom cache config file into the keycloak conf dir
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/conf/cache-ispn-jdbc-ping.xml $KC_FOLDER/conf/"]

# copy custom modules
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/modules/* $KC_FOLDER/providers/"]

# copy templates
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/templates/* $KC_FOLDER/themes/"]

# add integsoft version of keycloak jars
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/* $KC_FOLDER/lib/lib/main"]

RUN /opt/keycloak/bin/kc.sh build --health-enabled=true --spi-email-sender-provider=aws-ses --spi-email-sender-provider-aws-ses-enabled=true --spi-email-sender-provider-aws-ses-region=$AWS_REGION --features="token-exchange"
RUN /opt/keycloak/bin/kc.sh show-config

WORKDIR /opt/keycloak

# Ports
EXPOSE 8080 8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--optimized"]
