#### TIPS TO WRITE MSG DEFINITIONS
# Types: bool, int8, int16, int32, int64, uint8, uint16, uint32, uint64, float32, float64, char, byte, string
# Arrays: <type>[] <variable_name> (example: float32[] angles)
# Fixed Length Arrays: <type>[<length>] <variable_name> (example: uint8[15] distances)
# Bounded Length Arrays: <type>[<condition>] <variable_name> (example: bool[<=3] states)
#####

#### MSG DEFINITION
# Message time of publication
uint64 timestamp

# Line data topic:
#       This topic gives the coordinates of points of lines of color on the camera image
#       The topic currently lists lines of three colors, but could be adapted to list all colors using strings


# x is oriented to the right, is 0 at the left of the screen, 1 at the right
float32[] green_line_x
float32[] yellow_line_x
float32[] blue_line_x

# y is oriented downward, is 0 at the top of the screen, 1 at the bottom
float32[] green_line_y
float32[] yellow_line_y
float32[] blue_line_y