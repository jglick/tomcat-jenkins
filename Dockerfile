FROM debian:jessie

RUN (echo 'deb http://deb.debian.org/debian jessie-backports main contrib non-free'; echo 'deb http://deb.debian.org/debian jessie-backports-sloppy main contrib non-free') >> /etc/apt/sources.list
RUN apt update
RUN apt install -y openjdk-8-jre-headless ca-certificates-java=20161107~bpo8+1

RUN apt install -y tomcat8 tomcat8-admin
ADD tomcat-users.xml /var/lib/tomcat8/conf/

#ADD http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/2.103/jenkins-war-2.103.war /usr/local/tomcat/webapps/
COPY jenkins.war /var/lib/tomcat8/webapps/
ADD JH /usr/share/tomcat8/.jenkins
RUN chown -Rv tomcat8 /usr/share/tomcat8/.jenkins

CMD service tomcat8 start; sleep 3; tail -n +1 -f /var/lib/tomcat8/logs/catalina.out
