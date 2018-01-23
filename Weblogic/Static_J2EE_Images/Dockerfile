FROM tkrausjr/1221-appdeploy

ENV DOMAIN_NAME base_domain
ENV CLUSTER_NAME DockerCluster
ENV APP_NAME benefits
ENV ADMIN_PORT 7001
ENV ADMIN_PASS Welcome1
ENV DOMAIN_HOME /u01/oracle/user_projects/domains/base_domain
ENV APP_PKG_FILE benefits.war
ENV ADMIN_NAME weblogic
COPY benefits.war /u01/oracle/benefits.war
RUN env | sort
RUN ls -lt /u01/oracle/
RUN wlst /u01/oracle/app-deploy.py
