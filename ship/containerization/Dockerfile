# https://spring.io/guides/topicals/spring-boot-docker/
# Notice that the base image in the example above is openjdk:8-jdk-alpine. 
# The alpine images are smaller than the standard openjdk library images from Dockerhub. 
# There is no official alpine image for Java 11 yet (AdoptOpenJDK had one for a while but 
# it no longer appears on their Dockerhub page). 
# You can also save about 20MB in the base image by using the "jre" label instead of "jdk". 
# Not all apps work with a JRE (as opposed to a JDK), but most do, and indeed some organizations 
# enforce a rule that every app has to because of the risk of misuse of some of the JDK features (like compilation).

FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN

ARG MAVEN_SETTINGS=local
ENV MAVEN_SETTINGS ${MAVEN_SETTINGS}

ENV MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true"


COPY ${MAVEN_SETTINGS} /tmp/settings.xml

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn -B -s settings.xml --batch-mode package -P package-jar -Dmaven.test.skip=true $MAVEN_OPTS


FROM adoptopenjdk/openjdk11:alpine-jre
#
# Just as in classic VM-deployments, processes should not be run with root permissions.
#Instead the image should contain a non-root user that runs the app.
# In a Dockerfile, this can be achieved by adding another layer that adds a (system) user and group,
# then set it as the current user (instead of the default, root):
RUN addgroup -S spring-boot && adduser -S spring-boot -G spring-boot
USER spring-boot
#
VOLUME /tmp
#
# Once you have chosen a build system, you don’t need the ARG 
# you can just hard code the jar location. E.g. for Maven:

COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.jar app.jar
#
#
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar ${0} ${@}"]
