#### TIPS TO WRITE MSG DEFINITIONS
# Types: bool, int8, int16, int32, int64, uint8, uint16, uint32, uint64, float32, float64, char, byte, string
# Arrays: <type>[] <variable_name> (example: float32[] angles)
# Fixed Length Arrays: <type>[<length>] <variable_name> (example: uint8[15] distances)
# Bounded Length Arrays: <type>[<condition>] <variable_name> (example: bool[<=3] states)
#####

#### MSG DEFINITION
# Message time of publication
uint64 timestamp

# Picture data topic:
#       This topic lists the coordinates of the center of pictures found on the camera image

# x is oriented to the right, is 0 at the left of the screen, 1 at the right
float32[] x

# y is oriented downward, is 0 at the top of the screen, 1 at the bottom
float32[] y

# Types of pictures found (e.g. clownfish; bird; jellyfish...)
string[] classes

# Confidence in percentage from 0 to 1 of the recognized classes (0-1)
float32[] confidences


# Surfaces of the pictures found in portion of the total image plane (0-1)
float32[] scales
