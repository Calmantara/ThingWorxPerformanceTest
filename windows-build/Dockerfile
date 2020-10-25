# Dockerfile for build container ThingWorx JMeter test
# windowscore and OpenJDK as base of container
# adapted from justb4/jmeter:5.3
FROM openjdk:8-windowsservercore

# Steeing up JMeter version and home directory
ARG JMETER_VERSION="5.3"
ENV JMETER_HOME /apache-jmeter-$JMETER_VERSION/apache-jmeter-$JMETER_VERSION/

# Metadata maintainer
LABEL maintainer="calmantara"

# DEBUG
# RUN dir

#Download JMeter file from apache
RUN Invoke-WebRequest -URI https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$env:JMETER_VERSION.zip \
-UseBasicParsing -Outfile /apache-jmeter-$env:JMETER_VERSION.zip

# Extract the downloaded zip file
RUN Expand-Archive /apache-jmeter-$env:JMETER_VERSION.zip -DestinationPath /apache-jmeter-$env:JMETER_VERSION

# Copy entrypoint and jmeter plugin if needed
COPY /entrypoint.ps1 /entrypoint.ps1

# Plugin config
# COPY /plugin.ps1 /plugin.ps1
# RUN ["powershell.exe","/plugin.ps1"]

# Sets the Default Working directory
WORKDIR ${JMETER_HOME}/bin

# Set command env to process entrypoint
ENTRYPOINT [ "powershell.exe", "/entrypoint.ps1" ]