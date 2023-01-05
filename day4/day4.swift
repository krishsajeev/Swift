import Foundation

public func myCeil(num: Float) -> Int {
    var decimal = num - Float(Int(num))
    var whole = Int(num)
    
    if(decimal >= 0.5) {
        return whole + 1
    }
    else{
        return whole
    }
}

class Attribute {
    var val:Int
    
    init(val: Int) {
        self.val = val
    }
    
    func getVal() -> Int {
        return self.val
    }
}

class Rectangle
{
    private var left: Attribute
    private var top: Attribute
    private var width: Attribute
    private var height: Attribute
    private var area: Attribute
    
    
    init()
    {
        left = Attribute(val: 0)
        top = Attribute(val: 0)
        height = Attribute(val: 0)
        width = Attribute(val: 0)
        area = Attribute(val: 0)
    }

    init(w: Int, h: Int)
    {
        left = Attribute(val: 0)
        top = Attribute(val: 0)
        height = Attribute(val: h)
        width = Attribute(val: w)
        area = Attribute(val: (w * h))
    }
    
    init(l: Int, t: Int, w: Int, h: Int)
    {
        left = Attribute(val: l)
        top = Attribute(val: t)
        height = Attribute(val: h)
        width = Attribute(val: w)
        area = Attribute(val: (w * h))
    }

    init(l: Float, t: Float, w: Float, h: Float)
    {
        left = Attribute(val: Int(myCeil(num: l)))
        top = Attribute(val: Int(myCeil(num: t)))
        height = Attribute(val: Int(myCeil(num: h)))
        width = Attribute(val: Int(myCeil(num: w)))
        area = Attribute(val: Int(myCeil(num: w * h)))
    }
    
    init(obj: Rectangle)
    {
        self.height = obj.height
        self.width = obj.width
        self.area = obj.area
        self.top = obj.top
        self.left = obj.left
    }

    public func display() {
        print("LEFT: ", left.getVal(), "\nTOP: ", top.getVal(), "\nHEIGHT: ", height.getVal(), "\nWIDTH: ", width.getVal(), "\nAREA: ", area.getVal(), "\n\n")
    }
    
    deinit {
        print("DEALLOCATED")
    }
}

var r1: Rectangle! = Rectangle(l: 1.1, t: 2.4, w: 5.9, h: 7.3)
r1?.display()

var r2: Rectangle! = Rectangle(l: 1, t: 2, w: 4, h: 3)
r2?.display()

var r3: Rectangle! = Rectangle(w: 10, h: 11)
r3?.display()

var r4: Rectangle! = Rectangle(obj: r1)
r4?.display()

r1 = nil
r2 = nil
r3 = nil
r4 = nil
