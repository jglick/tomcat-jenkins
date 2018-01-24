FROM tomcat:7-jre8
ADD http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/2.103/jenkins-war-2.103.war /usr/local/tomcat/webapps/
ADD tomcat-users.xml /usr/local/tomcat/conf/
ADD JH /root/.jenkins
