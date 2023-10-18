FROM openjdk:11-slim

RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

RUN wget https://grill.wurstlang.org/hudson/job/WurstSetup/163/artifact/downloads/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript

ENV PATH="/home/wurstuser/.wurst/:${PATH}"
RUN chmod u+x /home/wurstuser/.wurst/grill
