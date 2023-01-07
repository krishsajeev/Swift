import Foundation

//Need not explicitly import Math class since it is included in the same project file
class MyClass : NSObject {
    var num1: Int = 23
    var num2: Int = 12
    
    typealias eqns = Math.Equations //Namespace Alias for the Namespace Math.Equations
    
    override init() {
        
    }
    
    func namespace() {
        print(eqns.add(a: num1, b: num2))
        print(eqns.subtract(a: num1, b: num2))
    }
    
}

MyClass().namespace()
