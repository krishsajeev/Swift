import Foundation

func compare(data1: Float, comparator: String, data2: Float) -> Bool {
    switch(comparator) {
    case ">":
        return data1 > data2
    case "<":
        return data1 < data2
    default:
        return data1 == data2
    }
}

func banner() {
    print("1. SIMULATE INPUT\n2. DEVICE AUTOMATION\n3. DEVICE STATUS\n--------\n")
    print("KEY CODES\n1. Increase Value\n2. Decrease Value\n3. Connect Device\n4. Disconnect Device\n\n--------\n")
}

var fan = Fan()
var door = Door()
var light = Light()

var water = WaterLevelSensor()
var temp = TemperatureSensor()
var gas = GasSensor()
var motion = MotionSensor()

var sensors: [String:Sensor] = ["TEMPERATURE":temp, "GAS":gas, "MOTION":motion, "WATERLEVEL":water]
var actuators: [String:Actuator] = ["FAN":fan, "DOOR":door, "LIGHT":light]

banner()
while(true) {
    print("\n\n\n-----------\n\nENTER THE OPTION\n")
    let option = readLine()
    
    if option == "1" {
        print("ENTER THE DEVICE NAME\n")
        let deviceName = readLine()
        
        print("ENTER THE KEY-CODE\n")
        let code = readLine()
        
        switch(code) {
        case "1":
            print("ENTER THE VALUE\n")
            let val: Float = Float(readLine()!)!
            sensors[deviceName!]!.increase(delta: val)
            break
        case "2":
            print("ENTER THE VALUE\n")
            let val: Float = Float(readLine()!)!
            sensors[deviceName!]!.decrease(delta: val)
            break
        case "3":
            if sensors.keys.contains(deviceName!) {
                sensors[deviceName!]!.onConnect()
            }
            
            if actuators.keys.contains(deviceName!) {
                actuators[deviceName!]!.onConnect()
            }
            break
        case "4":
            if sensors.keys.contains(deviceName!) {
                sensors[deviceName!]!.onDisconnect()
            }
            
            if actuators.keys.contains(deviceName!) {
                actuators[deviceName!]!.onDisconnect()
            }
            break
        default:
            break
        }
        
    }
    else if option == "2" {
        print("ENTER COMMAND STRICTLY ACCORDING TO THE SYNTAX\n")
        print("IF: ")
        let sensorName = readLine()
        print(" ")
        let comparator = readLine()
        print(" ")
        let val = Float(readLine()!)!
        print("\nTHEN: ")
        let actuatorName = readLine()
        print(" ")
        let action = Bool(readLine()!)!
        
        sensors[sensorName!]!.setListener { (reading: Float) in
            if actuators[actuatorName!]!.available() && compare(data1: sensors[sensorName!]!.getData(), comparator: comparator!, data2: val) {
                actuators[actuatorName!]!.setData(action: action)
            }
        }
    }
    else {
        print("\nDEVICES     -----    STATUS\n")
        for sensor in sensors.keys {
            if sensors[sensor]!.available() {
                print(sensor, " ", sensors[sensor]!.getData())
            }
        }
        for actuator in actuators.keys {
            if actuators[actuator]!.available() {
                print(actuator, " ", actuators[actuator]!.getStatus())
            }
        }
    }
    
}
