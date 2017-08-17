FROM resin/armv7hf-debian:latest
MAINTAINER Alexey Domozhirov <a.domozhirov@dooglys.com>

RUN apt-get update && apt-get upgrade

#Install Java8

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
&& echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
&& echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
&& apt-get update && apt-get install -y oracle-java8-installer \
&& rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#Copy the project

COPY /out/artifacts/HelloWorld_jar/HelloWorld.jar /var/HelloWorld/HelloWorld.jar
WORKDIR /var/HelloWorld

ENTRYPOINT ["java", "-jar", "-agentlib:jdwp=transport=dt_socket,address=8000,suspend=n,server=y", "HelloWorld.jar"]

EXPOSE 80

