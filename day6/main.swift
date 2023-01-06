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
    try division(numerator: 10, denominator: 10)
    print("Valid Division")
    
    try indexFinder(str: "sajeev", num: 2)
    print("Valid index")
    
    /*    DANGER ! DO NOT UNCOMMENT !
     
     var p: [UnsafeMutableRawPointer?] = Array()
     
    for _ in stride(from: 1, to: 99999999999, by: 1) {
        p.append(malloc(1048576))
    }
     
    */
    
    let arr = Array(repeating: 1, count: 10)
    try arrayIndexFinder(arr: arr, index: 89)
    print("Valid Array Index")
}

// catch error if function throws an error
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
