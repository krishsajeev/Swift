import Foundation

class Math: NSObject {  //Namespace demonstrated using class
    class Equations {   //Nested namespace using nested classess
        static func add(a: Int, b: Int) -> Int{
            return a + b
        }
        static func subtract(a: Int,b: Int) -> Int {
            return a - b
        }
    }
}
