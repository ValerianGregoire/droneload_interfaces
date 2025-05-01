#### TIPS TO WRITE MSG DEFINITIONS
# Types: bool, int8, int16, int32, int64, uint8, uint16, uint32, uint64, float32, float64, char, byte, string
# Arrays: <type>[] <variable_name> (example: float32[] angles)
# Fixed Length Arrays: <type>[<length>] <variable_name> (example: uint8[15] distances)
# Bounded Length Arrays: <type>[<condition>] <variable_name> (example: bool[<=3] states)
#####

#### MSG DEFINITION
# Message time of publication
uint64 timestamp

# Movement request topic:
#       This topic gives the movement commands that need to be sent to PX4 to control the drone

# The commands can be : forward, backward, fly_right, fly_left, yaw_right, yaw_left, up, down
string command

uint32 command_duration_ms # For how long the command should be applied in ms before going back to stationnary

