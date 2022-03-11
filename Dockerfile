FROM jboss/keycloak:15.0.2

LABEL maintainer="support@integrationeye.com"
LABEL builder="Integsoft s.r.o"
LABEL description="MBTA Keycloak"

ENV INSTALL_FOLDER=/tmp/files/

USER root
# install system tools and update system
RUN ["/bin/bash", "-c", "microdnf update -y && microdnf install -y vim"]
# remove root password
# RUN ["/bin/bash", "-c", "passwd --delete root"]

USER jboss

# copy build scripts and related data
COPY files/ $INSTALL_FOLDER
# copy CLI scripts (in this version it is not supported to use startup-scripts variable
COPY files/startup-scripts/* /opt/jboss/startup-scripts/
# copy custom modules
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/modules/* $JBOSS_HOME/modules/"]

# copy templates
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/templates/* $JBOSS_HOME/themes/"]

# replace keycloak-model-infinispan
# TODO weird, to be reviewed
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/keycloak-model-infinispan-15.0.2.jar $JBOSS_HOME/modules/system/layers/keycloak/org/keycloak/keycloak-model-infinispan/main/"]

# copy AWS SES SPI library
RUN ["/bin/bash", "-c", "cp -Rv $INSTALL_FOLDER/mbta-keycloak-aws-ses-email-provider-1.0.0.jar $JBOSS_HOME/standalone/deployments/"]

# Ports
EXPOSE 8080 8443

