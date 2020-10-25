# @maintainer Calmantara186

$JMETER_VERSION="5.3"
# Download file
Invoke-WebRequest -URI https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.zip -UseBasicParsing -Outfile ./apache-jmeter-$JMETER_VERSION.zip
# Unzip file
Expand-Archive ./apache-jmeter-$JMETER_VERSION.zip -DestinationPath ./apache-jmeter-$JMETER_VERSION
