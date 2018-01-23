FROM jboss/base:latest
MAINTAINER Mark Johnson <mjohnson@mesosphere.com>

# User root user to install software
USER root

# Install necessary packages
RUN yum -y install yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel net-tools && yum clean all


# Switch back to jboss user
#USER jboss

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java