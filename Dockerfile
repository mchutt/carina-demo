FROM amazoncorretto:11-alpine3.18
WORKDIR /app
RUN apk update && \
    apk add --no-cache wget tar && \
    wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz && \
    tar -zxvf apache-maven-3.9.9-bin.tar.gz -C /opt && \
    rm apache-maven-3.9.9-bin.tar.gz && \
    ln -s /opt/apache-maven-3.9.9/bin/mvn /usr/bin/mvn
COPY . .
ENV SUITE_NAME=helloWord
ENTRYPOINT ["sh", "-c", "mvn test -Dsuite=${SUITE_NAME}"]
