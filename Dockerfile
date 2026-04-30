FROM eclipse-temurin:25-jdk AS installer

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

RUN curl -L -o WurstSetup.jar https://github.com/wurstscript/WurstSetup/releases/download/nightly-master/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript
RUN chmod -R u+x /home/wurstuser/.wurst/


FROM alpine:3.21

RUN adduser -D -s /bin/sh wurstuser
COPY --from=installer --chown=wurstuser:wurstuser /home/wurstuser/.wurst/ /home/wurstuser/.wurst/

USER wurstuser
WORKDIR /home/wurstuser
ENV PATH="/home/wurstuser/.wurst/:${PATH}"
