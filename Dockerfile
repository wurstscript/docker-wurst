FROM eclipse-temurin:25-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

RUN curl -L -o WurstSetup.jar https://github.com/wurstscript/WurstSetup/releases/download/nightly-master/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript
RUN chmod -R u+x /home/wurstuser/.wurst/

ENV PATH="/home/wurstuser/.wurst/:${PATH}"
