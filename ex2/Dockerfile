# use the latest ubuntu LTS version
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64

# install python3, scala and vim and clean apt cache
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates curl gnupg lsb-release software-properties-common \
      python3 python3-venv python3-pip scala vim wget && \
    rm -rf /var/lib/apt/lists/*

# install Temurin Java 8
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/keyrings/adoptium.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb $(lsb_release -sc) main" \
      > /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && apt-get install -y --no-install-recommends temurin-8-jdk && \
    rm -rf /var/lib/apt/lists/*

# install sbt
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://repo.scala-sbt.org/scalasbt/debian/pubkey.gpg | gpg --dearmor -o /etc/apt/keyrings/sbt-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/sbt-archive-keyring.gpg] https://repo.scala-sbt.org/scalasbt/debian all main" \
      > /etc/apt/sources.list.d/sbt.list && \
    apt-get update && apt-get install -y --no-install-recommends sbt && \
    rm -rf /var/lib/apt/lists/*

# soft check
RUN java -version && javac -version && python3 --version && scala --version && sbt sbtVersion || true

WORKDIR /workspace
