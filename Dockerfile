FROM index.docker.io/jboss/keycloak:15.0.2

LABEL maintainer="support@integrationeye.com"
LABEL builder="Integsoft s.r.o"
LABEL description="MBTA Keycloak"

ENV INSTALL_FOLDER=/tmp/files

USER root
# install system tools and update system
RUN ["/bin/bash", "-c", "microdnf update -y && microdnf install -y vim"]
# remove root password
# RUN ["/bin/bash", "-c", "passwd --delete root"]

USER jboss

# copy build scripts and related data
COPY files/ $INSTALL_FOLDER/

# copy CLI scripts (in this version it is not supported to use startup-scripts variable
COPY files/startup-scripts/* /opt/jboss/startup-scripts/
# copy custom modules
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/modules/* $JBOSS_HOME/modules/"]

# copy welcome page
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/welcome-content/* $JBOSS_HOME/welcome-content/"]

# copy templates
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/templates/* $JBOSS_HOME/themes/"]

# add integsoft version of keycloak-model-infinispan and replace module.xml
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/keycloak-model-infinispan/* $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-model-infinispan/main/"]

# add integsoft version of keycloak-ldap-federation and replace module.xml
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/keycloak-ldap-federation/* $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-ldap-federation/main/"]

# add integsoft version of keycloak-server-spi and replace module.xml
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/keycloak-server-spi/* $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-server-spi/main/"]

# add integsoft version of keycloak-server-spi-private and replace module.xml
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/keycloak-server-spi-private/* $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-server-spi-private/main/"]

# add integsoft version of keycloak-services and replace module.xml
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-modules/keycloak-services/* $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-services/main/"]

# copy AWS SES SPI library
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/mbta-keycloak-aws-ses-email-provider-1.0.0.jar $JBOSS_HOME/standalone/deployments/"]

# Ports
EXPOSE 8080 8443

