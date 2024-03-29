FROM openjdk:8-jre-slim AS builder

ENV DEPCHECK_VER 8.3.1

RUN apt-get update && \
	apt-get install -y wget unzip

RUN echo Install OWASP Dependency Check CLI && \
	wget -q https://github.com/jeremylong/DependencyCheck/releases/download/v$DEPCHECK_VER/dependency-check-$DEPCHECK_VER-release.zip && \
	unzip -q dependency-check-${DEPCHECK_VER}-release.zip && \
	rm -f dependency-check-${DEPCHECK_VER}-release.zip && \
	mv dependency-check /opt/ && \
	echo export PATH=\$PATH:/opt/dependency-check/bin >> /etc/profile && \
	. /etc/profile && \
	dependency-check.sh -v

FROM openjdk:8-jre-slim
ENV PATH="${PATH}:/opt/dependency-check/bin"
COPY --from=builder /opt/dependency-check /opt/dependency-check
COPY --from=builder /etc/profile /etc/profile
RUN env && dependency-check.sh -v
