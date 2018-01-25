FROM tkrausjr/1221-appdeploy

RUN yum install -y nmap net-tools
COPY benefits.war /u01/oracle/benefits.war
RUN wlst /u01/oracle/app-deploy.py
