import Foundation

class UserException {
    // create an enum with error values
    enum MyExceptions: Error {
        case dividedByZero
        case invalidIndex
        case invalidArrayIndex
    }

    // create a throwing function using throws keyword
    static func division(numerator: Int, denominator: Int) throws {

      // throw error if divide by 0
        if denominator == 0 {
          throw MyExceptions.dividedByZero
        }
        
        else {
          let result = numerator / denominator
          print(result)
        }
    }

    static func indexFinder(str: String, num: Int) throws {
        if num < 0 || num >= str.count {
            throw MyExceptions.invalidIndex
        }
        else {
            let indx = str.index(str.startIndex, offsetBy: num)
            print(str[indx])
        }
    }

}

// call throwing function from do block
do {
    try UserException.division(numerator: 10, denominator: 10)
    print("Valid Division")
    
    do {
        try UserException.indexFinder(str: "sajeev", num: 2)
        print("Valid index")
    } catch UserException.MyExceptions.invalidIndex {
        print("Index is Invalid")
        throw UserException.MyExceptions.invalidIndex
    }

} catch UserException.MyExceptions.dividedByZero {
    print("Invalid Division Error")
}
catch UserException.MyExceptions.invalidIndex {
    print("Rethrowed Exception")
}
