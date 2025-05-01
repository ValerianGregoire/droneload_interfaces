# droneload_interfaces
ROS interfaces for the Droneload challenge

## Use of this package
This package allows the `droneload_auto` package to use custom topics, as the `droneload_auto` package is compiled in Python instead of C++. This package also serves as a means to learn how to define interfaces in ROS 2 such as topics, services, and actions.

## How to create a new topic
To create any custom interface, the project must be compiled in C++. To verify that the project uses the correct language, check that the line `<buildtool_depend>ament_cmake</buildtool_depend>` is present in `package.xml`. `ament_cmake` must appear instead of `ament_python`.

If the project is compiled in the correct language:

1. **Create the msg folder**:
   - At the root of your package, create a folder named `msg` (if it doesn't already exist).

2. **Define the message**:
   - Inside the `msg` folder, create a `.msg` file. For example:
     ```
     DroneStatus.msg
     ```
   - Fill it with your message fields. Example:
     ```
     string drone_id
     float32 battery_level
     bool is_flying
     ```

3. **Update CMakeLists.txt**:
   - Add the following lines if not already written:
     ```cmake
     find_package(rosidl_default_generators REQUIRED)

     rosidl_generate_interfaces(${PROJECT_NAME}
       "msg/DroneStatus.msg"
       <other interface names>
       <for every new interface>
     )
     ```

4. **Update package.xml**:
   - Add dependencies:
     ```xml
     <build_depend>rosidl_default_generators</build_depend>
     <exec_depend>rosidl_default_runtime</exec_depend>
     ```

5. **Build the package**:
   - Run:
     ```bash
     colcon build --packages-select droneload_interfaces
     ```

Your new topic will now be available for use across other ROS 2 packages.

## How to create a new service
1. **Create the srv folder**:
   - At the root of your package, create a folder named `srv`.

2. **Define the service**:
   - Inside the `srv` folder, create a `.srv` file. For example:
     ```
     SetAltitude.srv
     ```
   - Define the request and response format:
     ```
     float32 altitude
     ---
     bool success
     string message
     ```

3. **Update CMakeLists.txt**:
   - Add your new service alongside other interfaces:
     ```cmake
     rosidl_generate_interfaces(${PROJECT_NAME}
       "msg/DroneStatus.msg"
       "srv/SetAltitude.srv"
     )
     ```

4. **Update package.xml**:
   - Ensure the same dependencies as above are present.

5. **Rebuild the package**:
   ```bash
   colcon build --packages-select droneload_interfaces
   ```

## How to create a new action
Actions in ROS 2 are useful for long-running tasks that require feedback during execution.

1. **Create the action folder**:
   - At the root of your package, create a folder named `action` (if it does not already exist).

2. **Define the action**:
   - Inside the `action` folder, create a `.action` file, for example:
     ```
     DeliverPackage.action
     ```
   - Define its three components (Goal, Result, Feedback) separated by `---`:
     ```
     # Goal
     string package_id
     geometry_msgs/Pose delivery_location

     ---
     # Result
     bool success
     string message

     ---
     # Feedback
     float32 progress
     ```

3. **Update CMakeLists.txt**:
   - Add your new action along with other interfaces in the `rosidl_generate_interfaces` block:
     ```cmake
     rosidl_generate_interfaces(${PROJECT_NAME}
       "msg/DroneStatus.msg"
       "srv/SetAltitude.srv"
       "action/DeliverPackage.action"
       DEPENDENCIES std_msgs geometry_msgs
     )
     ```

4. **Update package.xml**:
   - Ensure you have dependencies for the additional message types, for example:
     ```xml
     <depend>geometry_msgs</depend>
     ```

5. **Build the package**:
   ```bash
   colcon build --packages-select droneload_interfaces

## How to check the interface definition
For topics :
```bash
ros2 interface show droneload_interfaces/msg/DroneStatus
```
For services :
```bash
ros2 interface show droneload_interfaces/srv/SetAltitude
```
For actions :
```bash
ros2 interface show droneload_interfaces/action/DeliverPackage
```
In short, give the path to your interface when calling `interface <command> <interface>`.

## How to import the created interfaces in a Node code
```python
from droneload_interfaces.msg import DroneStatus
from droneload_interfaces.srv import SetAltitude
from droneload_interfaces.action import DeliverPackage
```
