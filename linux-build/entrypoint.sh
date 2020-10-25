# Print message that start the command
WRITE-HOST "Execute JMeter with arguments: $args"

# Constructs the JMeter command and execute it
$command = -join(".\jmeter ","$args")
INVOKE-EXPRESSION $command

# Completed execution
WRITE-HOST "Execution JMeter has been completed"