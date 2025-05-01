#### TIPS TO WRITE MSG DEFINITIONS
# Types: bool, int8, int16, int32, int64, uint8, uint16, uint32, uint64, float32, float64, char, byte, string
# Arrays: <type>[] <variable_name> (example: float32[] angles)
# Fixed Length Arrays: <type>[<length>] <variable_name> (example: uint8[15] distances)
# Bounded Length Arrays: <type>[<condition>] <variable_name> (example: bool[<=3] states)
#####

#### MSG DEFINITION
# Message time of publication
uint64 timestamp
