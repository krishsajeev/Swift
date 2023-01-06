import Foundation

var arr = ["History", "Science", "Math"]

var flag: Bool = false

enum MyExceptions: Error {
    case DuplicateInstance
    case AgeNotWithinRange
    case InvalidCourseException
    case NameNotValidException
}

class Student {
    var rollno: Int
    var name: String
    var age: Int
    var course: String
    
    init (rollno: Int, name: String, age: Int, course: String) {
        do {
            if flag {
                throw MyExceptions.DuplicateInstance
            }
            if (!(age >= 15 && age <= 21)) {
                throw MyExceptions.AgeNotWithinRange
            }
            if !(arr.contains(course)) {
                throw MyExceptions.InvalidCourseException
            }
            for ascii in name.utf8 {
                if !(ascii >= 97 && ascii <= 122) && !(ascii <= 65 && ascii  <= 90) {
                    throw MyExceptions.NameNotValidException
                }
            }
            
        }
        catch MyExceptions.AgeNotWithinRange {
            print("Age Not Within Range")
        }
        catch MyExceptions.DuplicateInstance {
            print("Duplicate Instance")
        }
        catch MyExceptions.InvalidCourseException {
            print("Invalid Course ")
        }
        catch MyExceptions.NameNotValidException {
            print("Invalid Name Exception")
        }
        catch {
            print("Some other error")
        }
        
        self.age = age
        self.rollno = rollno
        self.course = course
        self.name = name
        flag = true
    }
}


var stud: Student = Student(rollno: 123, name: "sajeev", age: 17, course: "History")

var stud2: Student = Student(rollno: 123, name: "sajeev", age: 17, course: "History")

