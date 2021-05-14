FROM centos

MAINTAINER aravindreddy.urs@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz
RUN tar xvfz apache-tomcat-9.0.46.tar.gz
RUN mv apache-tomcat-9.0.46/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
RUN chmod -R 777 /opt/tomcat/webapps
WORKDIR /opt/tomcat/webapps
COPY target/java-web-app*.war java-web-app.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
