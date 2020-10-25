# @maintainer = Calmantara
$JMETER_VERSION="5.3"

# Build command
$command=-join("docker build --build-arg JMETER_VERSION=","$JMETER_VERSION"," -t calmantara186/jmeter-tw-windows:windows .\windows-build") 
INVOKE-EXPRESSION $command