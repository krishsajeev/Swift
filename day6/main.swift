import Foundation

// create an enum with error values
enum MyExceptions: Error {
    case dividedByZero
    case invalidIndex
    case invalidArrayIndex
}

// create a throwing function using throws keyword
func division(numerator: Int, denominator: Int) throws {

  // throw error if divide by 0
    if denominator == 0 {
      throw MyExceptions.dividedByZero
    }
    else {
      let result = numerator / denominator
      print(result)
    }
}

func indexFinder(str: String, num: Int) throws {
    if num < 0 || num >= str.count {
        throw MyExceptions.invalidIndex
    }
    else {
        let indx = str.index(str.startIndex, offsetBy: num)
        print(str[indx])
    }
}

func arrayIndexFinder(arr: [Int], index: Int) throws {
    if index < 0 || index >= arr.count {
        throw MyExceptions.invalidArrayIndex
    }
    else {
        print(arr[index])
    }
}

// call throwing function from do block
do {
    print("ENTER THE NUMERATOR\n")
    let num1 = Int(readLine()!)!
    print("ENTER THE DENOMINATOR\n")
    let num2 = Int(readLine()!)!
    
    try division(numerator: num1, denominator: num2)    //Division by zero
    print("Valid Division")
    
    /*    DANGER ! DO NOT UNCOMMENT !               //Heap memory
     
     var p: [UnsafeMutableRawPointer?] = Array()
     
    for _ in stride(from: 1, to: 99999999999, by: 1) {
        p.append(malloc(1048576))
    }
     
    */
    
    //String cannot be passed to numeric variable since Swift throws Build Error
    
    print("ENTER THE STRING\n")
    let str = readLine()
    print("ENTER THE INDEX\n")
    let index = Int(readLine()!)!
    
    try indexFinder(str: str!, num: index)  //Invalid String index error
    print("Valid index")
    
    print("ENTER A SIZE TO CREATE AN ARRAY OF REPEATING 1s\n")
    let size = Int(readLine()!)!
    print("ENTER THE INDEX\n")
    let idx = Int(readLine()!)!
    let arr = Array(repeating: 1, count: size)   //Invalid Array index error
    try arrayIndexFinder(arr: arr, index: idx)
    print("Valid Array Index")
}
catch MyExceptions.dividedByZero {
    print("Invalid Division Error")
}
catch MyExceptions.invalidIndex {
    print("Index is Invalid")
}
catch MyExceptions.invalidArrayIndex {
    print("Array Index is Invalid")
}
catch {
    print("Exception Encountered")
}

print("Exception handling Accomplished")
