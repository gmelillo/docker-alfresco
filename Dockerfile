FROM ubuntu:18.04
LABEL maintainer="gabriel@melillo.me"

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install openjdk-8-jdk wget locales tzdata && \
	locale-gen en_US.UTF-8 && dpkg-reconfigure locales tzdata && \
	echo "Europe/Berlin" > /etc/timezone && \
	dpkg-reconfigure --frontend noninteractive tzdata

RUN wget -O alfresco-community-5.0.b-installer-linux-x64.bin \
	http://dl.alfresco.com/release/community/5.0.d-build-00002/alfresco-community-5.0.d-installer-linux-x64.bin
RUN chmod +x alfresco-community-5.0.b-installer-linux-x64.bin

RUN ./alfresco-community-5.0.b-installer-linux-x64.bin \
	--mode text \
	--installer-language en \
	--baseunixservice_install_as_service 1 \
	--alfresco_admin_password AlfrescoAdmin

EXPOSE 80
EXPOSE 21
EXPOSE 139
EXPOSE 445
EXPOSE 7070
EXPOSE 8009
EXPOSE 8080
EXPOSE 8443

CMD service alfresco start && /bin/sh -c "while true;do sleep 1;done"

