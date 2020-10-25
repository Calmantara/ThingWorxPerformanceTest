# Test the JMeter Docker Image with ThingWorx Server
#
# ThingWorx Etities:
#	- Thing = SandBox.Generic.Thing
#
# Test Plant:
#   - Fetch service with 1k message size
#	- Fetch service with 100k message size
#	- Fetch service with 500k message size
#	- Fetch service with 1M message size
#	- Fetch service with 5M message size
#
# Default Param:
#	- TARGET_HOST = 127.0.0.1
#	- TARGET_PORT = 80
#	- TARGET_APPKEY = 0000
#	- THREAD = 1
#	- SCHEME = http
#	
# Adapted from github.com/justb4/docker-jmeter
# @maintainer = Calmantara

$config = (Get-Content "config.json" -Raw) | ConvertFrom-Json

# Config variables
$T_DIR=".\thingworx-test"
$JMETER_VERSION="5.3"
$VOLUME_PATH="C:\apache-jmeter-$JMETER_VERSION\apache-jmeter-$JMETER_VERSION\bin\jmeter-tw"
#Docker variables
$CONTAINER_NAME="jmeter"
$IMAGE_NAME="calmantara186/jmeter-tw-windows:windows"

($config.servers) | foreach-object {
    # Set report directory for each server
    $R_DIR="$VOLUME_PATH\thingworx-test\report\$($_.SERVER_NAME)"
    # Remove existing report and create new one
    try{
        # REMOVE-ITEM -Force -Recurse -Path "$R_DIR\*"
        REMOVE-ITEM -Force -Recurse ".\thingworx-test\report\$($_.SERVER_NAME)"
        # Get-ChildItem $R_DIR -Recurse | Remove-Item -Force
    }catch{
        WRITE-HOST "Directory already clean"
    }

    # Build command
    $stop_container="docker stop $CONTAINER_NAME"
    $rm_previous_container="docker rm $CONTAINER_NAME" 
    $rm_container="docker container rm $CONTAINER_NAME"
    $start_test=-join("docker run --name $CONTAINER_NAME -i -v $($PWD):$($VOLUME_PATH)",
    " $IMAGE_NAME", 
    " -SERVER_NAME '$($_.SERVER_NAME)' -JTARGET_HOST '$($_.TARGET_HOST)' -JTARGET_PORT '$($_.TARGET_PORT)'",
    " -JTARGET_APPKEY '$($_.TARGET_APPKEY)' -JTHREADS '$($_.THREADS)' -JSCHEME '$($_.SCHEME)'",
    " -FILE $VOLUME_PATH\thingworx-test\thingworx-test.jmx",
    " -RAW $R_DIR\thingworx-test-$($_.SERVER_NAME).csv", 
    " -LOG $R_DIR\thingworx-jmeter-$($_.SERVER_NAME).log",
    " -REPORT $R_DIR\report") 
    # Running Docker
    INVOKE-EXPRESSION $stop_container
    INVOKE-EXPRESSION $rm_previous_container
    INVOKE-EXPRESSION $start_test
    INVOKE-EXPRESSION $rm_container
}

    WRITE-HOST "END OF PROCESS"