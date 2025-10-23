FROM alpine:3.10
MAINTAINER krsna
RUN mkdir /usr/local/tomcat/
WORKDIR /usr/local/tomcat
RUN apk --no-cache add curl && \
    apk add --update curl && \
        curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.111/bin/apache-tomcat-9.0.111.tar.gz
RUN tar -xvf apache*.tar.gz
RUN mv apache-tomcat-9.0.111/* /usr/local/tomcat/.
RUN rm -rf apache-*
COPY SimpleCustomerApp-13-SNAPSHOT.war /usr/local/tomcat/webapps
RUN apk update && apk add openjdk8
WORKDIR /usr/local/tomcat
EXPOSE 8081
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
