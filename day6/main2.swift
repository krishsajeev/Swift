import Foundation

enum MyExceptions: Error {
    case dividedByZero
    case invalidIndex
    case invalidArrayIndex
}

// create an enum with error values

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


class Exc {
    
    init () {
        
        // call throwing function from do block
        do {
            try division(numerator: 10, denominator: 10)
            print("Valid Division")
            
            do {
                try indexFinder(str: "sajeev", num: 2)
                print("Valid index")
            } catch MyExceptions.invalidIndex {
                print("Index is Invalid")
                throw MyExceptions.invalidIndex
            }

        } catch MyExceptions.dividedByZero {
            print("Invalid Division Error")
        }
        catch MyExceptions.invalidIndex {
            print("Rethrowed Exception")
        }
        catch {
            print("Exception handled")
        }
        
    }
    
}

var t = Exc()
