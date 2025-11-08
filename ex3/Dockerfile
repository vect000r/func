FROM sbtscala/scala-sbt:eclipse-temurin-alpine-24.0.1_9_1.11.7_3.7.3 AS builder
LABEL authors="vect0r"

WORKDIR /app

COPY build.sbt .
COPY project/ ./project/

COPY ex3/src/ ./ex3/src/

RUN sbt "ex3/assembly"

FROM eclipse-temurin:17-jre-alpine

WORKDIR /opt/app

COPY --from=builder /app/ex3/target/scala-3.7.3/ex3-assembly-0.1.0-SNAPSHOT.jar ./app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar", "--host", "0.0.0.0", "--port", "8080"]