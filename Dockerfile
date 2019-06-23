FROM openjdk:11.0.3-jre-slim

ENV DISTR_DIR /distr
WORKDIR $DISTR_DIR

RUN apt-get update && \
	apt-get install -y wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN echo Install OWASP Dependency Check CLI && \
	wget -q http://dl.bintray.com/jeremy-long/owasp/dependency-check-5.0.0-M1-release.zip && \
	unzip -q dependency-check-5.0.0-M1-release.zip && \
	rm -f dependency-check-5.0.0-M1-release.zip && \
	mv dependency-check /usr/local/ && \
	echo export PATH=\$PATH:/usr/local/dependency-check/bin >> /etc/profile && \
	. /etc/profile && \
	dependency-check.sh -v
