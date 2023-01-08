import Foundation

protocol Actuator{
    var state: Bool {get set}
    var isConnected: Bool {get set}
    
    func setData(action: Bool)
    func onConnect()
    func onDisconnect()
    func getStatus() -> Bool
    func available() -> Bool
}

class Fan : Actuator{
    
    internal var state: Bool = false
    internal var isConnected: Bool = false
    
    public func setData(action: Bool)
    {
            state=action;
    }
    public func onConnect()
    {
            isConnected = true;
    }
    public func onDisconnect()
    {
            isConnected = false;
    }
    public func getStatus() -> Bool
    {
            return state;
    }
    public func available() -> Bool
    {
            return isConnected;
    }
}

class Light : Actuator{
    
    internal var state: Bool = false
    internal var isConnected: Bool = false
    
    public func setData(action: Bool)
    {
            state=action;
    }
    public func onConnect()
    {
            isConnected = true;
    }
    public func onDisconnect()
    {
            isConnected = false;
    }
    public func getStatus() -> Bool
    {
            return state;
    }
    public func available() -> Bool
    {
            return isConnected;
    }
}

class Door : Actuator{
    
    internal var state: Bool = false
    internal var isConnected: Bool = false
    
    public func setData(action: Bool)
    {
            state=action;
    }
    public func onConnect()
    {
            isConnected = true;
    }
    public func onDisconnect()
    {
            isConnected = false;
    }
    public func getStatus() -> Bool
    {
            return state;
    }
    public func available() -> Bool
    {
            return isConnected;
    }
}

