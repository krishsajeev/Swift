import Foundation

protocol Sensor{
    func getData() -> Float

    func increase(delta: Float)
    func decrease(delta: Float)

    func onConnect()
    func onDisconnect()

    func setListener(fun: @escaping (Float) -> Void)
    func onChange()
        
    func available() -> Bool
}

class TemperatureSensor : Sensor{
    internal var temperature: Float = 0;
    internal var isConnected : Bool = false;
 
    public var subscribers = Array<(Float)->Void>()
    
    public func increase(delta: Float)
    {
        temperature += delta;
        onChange();
    }
    public func decrease(delta: Float)
    {
        temperature -= delta;
        onChange();
    }
    func getData() -> Float
    {
        return temperature;
    }

    func setListener(fun: @escaping (Float) -> Void)
    {
        subscribers.append(fun);
        onChange();
    }
    
    func onChange()
    {
        for subscriber in subscribers {
            subscriber(self.temperature)
        }
    }

    func onConnect()
    {
        isConnected = true;
    }
    func onDisconnect()
    {
        isConnected = false;
    }
    func available() -> Bool
    {
        return isConnected;
    }
}

class MotionSensor : Sensor{
    internal var motion: Float = 0;
    internal var isConnected : Bool = false;
 
    public var subscribers = Array<(Float)->Void>()
    
    public func increase(delta: Float)
    {
        motion += delta;
        onChange();
    }
    public func decrease(delta: Float)
    {
        motion -= delta;
        onChange();
    }
    func getData() -> Float
    {
        return motion;
    }

    func setListener(fun: @escaping (Float) -> Void)
    {
        subscribers.append(fun);
        onChange();
    }
    
    func onChange()
    {
        for subscriber in subscribers {
            subscriber(self.motion)
        }
    }

    func onConnect()
    {
        isConnected = true;
    }
    func onDisconnect()
    {
        isConnected = false;
    }
    func available() -> Bool
    {
        return isConnected;
    }
}


class WaterLevelSensor : Sensor{
    internal var waterLevel: Float = 0;
    internal var isConnected : Bool = false;
 
    public var subscribers = Array<(Float)->Void>()
    
    public func increase(delta: Float)
    {
        waterLevel += delta;
        onChange();
    }
    public func decrease(delta: Float)
    {
        waterLevel -= delta;
        onChange();
    }
    func getData() -> Float
    {
        return waterLevel;
    }

    func setListener(fun: @escaping (Float) -> Void)
    {
        subscribers.append(fun);
        onChange();
    }
    
    func onChange()
    {
        for subscriber in subscribers {
            subscriber(self.waterLevel)
        }
    }

    func onConnect()
    {
        isConnected = true;
    }
    func onDisconnect()
    {
        isConnected = false;
    }
    func available() -> Bool
    {
        return isConnected;
    }
}


class GasSensor : Sensor{
    internal var gasLevel: Float = 0;
    internal var isConnected : Bool = false;
 
    public var subscribers = Array<(Float)->Void>()
    
    public func increase(delta: Float)
    {
        gasLevel += delta;
        onChange();
    }
    public func decrease(delta: Float)
    {
        gasLevel -= delta;
        onChange();
    }
    func getData() -> Float
    {
        return gasLevel;
    }

    func setListener(fun: @escaping (Float) -> Void)
    {
        subscribers.append(fun);
        onChange();
    }
    
    func onChange()
    {
        for subscriber in subscribers {
            subscriber(self.gasLevel)
        }
    }

    func onConnect()
    {
        isConnected = true;
    }
    func onDisconnect()
    {
        isConnected = false;
    }
    func available() -> Bool
    {
        return isConnected;
    }
}

