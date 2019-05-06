FROM openjdk:8u212-jdk-stretch

RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

RUN wget https://grill.wurstlang.org/hudson/job/WurstSetup/118/artifact/downloads/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript

ENV PATH="/home/wurstuser/.wurst/:${PATH}"
RUN chmod u+x /home/wurstuser/.wurst/grill
