FROM eclipse-temurin:25-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash wurstuser
USER wurstuser
WORKDIR /home/wurstuser

# Grill (formerly WurstSetup) is published as a nightly fat jar on the
# nightly-master tag, which the upstream deploy workflow force-updates on every
# push to master. Pulling it at build time always yields the latest version.
RUN curl -L -o grill.jar https://github.com/wurstscript/WurstSetup/releases/download/nightly-master/WurstSetup.jar

# Installs the WurstScript compiler to ~/.wurst and creates the `grill`/`wurstscript`
# launchers there. This runs non-interactively: requireConfirmation defaults to false,
# so `install wurstscript` never blocks on stdin.
RUN java -jar grill.jar install wurstscript
RUN chmod -R u+x /home/wurstuser/.wurst/

ENV PATH="/home/wurstuser/.wurst/:${PATH}"
