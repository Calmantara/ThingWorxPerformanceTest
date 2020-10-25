# @maintainer = Calmantara
# Print message that start the command
Param(
    [string] $SERVER_NAME,
    [string] $JTARGET_HOST,
    [string] $JTARGET_PORT,
    [string] $JTARGET_APPKEY,
    [string] $JTHREADS,
    [string] $JSCHEME,
    [string] $FILE,
    [string] $RAW,
    [string] $LOG,
    [string] $REPORT
)

$args

# WRITE-HOST -join("Execute JMeter with arguments: ",
# "-JTARGET_HOST='$JTARGET_HOST' ",
# "-JTARGET_PORT=$JTARGET_PORT ",
# "-JTARGET_APPKEY=$JTARGET_APPKEY ",
# "-JTHREADS=$JTHREADS ",
# "-JSCHEME=$JSCHEME ",
# "-n -t $FILE ",
# "-l $RAW ",
# "-j $LOG ", 
# "-e -o $REPORT $args")

# Constructs the JMeter command and execute it
$command = -join(".\jmeter ",
"-JTARGET_HOST='$JTARGET_HOST' ",
"-JTARGET_PORT=$JTARGET_PORT ",
"-JTARGET_APPKEY=$JTARGET_APPKEY ",
"-JTHREADS=$JTHREADS ",
"-JSCHEME=$JSCHEME ",
"-n -t $FILE ",
"-l $RAW ",
"-j $LOG ", 
"-e -o $REPORT $args")
INVOKE-EXPRESSION $command

# Completed execution
WRITE-HOST "Execution JMeter has been completed for $SERVER_NAME"
