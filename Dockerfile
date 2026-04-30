FROM eclipse-temurin:25-jdk

RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

RUN wget https://github.com/wurstscript/WurstSetup/releases/download/nightly-master/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript

ENV PATH="/home/wurstuser/.wurst/:${PATH}"
RUN chmod u+x /home/wurstuser/.wurst/grill
