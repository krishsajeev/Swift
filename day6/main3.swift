import Foundation

var arr = ["history", "science", "math"]

var flag: Bool = false

enum MyExceptions: Error {
    case DuplicateInstance
    case AgeNotWithinRange
    case InvalidCourseException
    case NameNotValidException
}

class Student {
    var rollno: String
    var name: String
    var age: Int
    var course: String
    
    init (rollno: String, name: String, age: Int, course: String) {
        do {
            if flag {
                throw MyExceptions.DuplicateInstance
            }
            if (!(age >= 15 && age <= 21)) {
                throw MyExceptions.AgeNotWithinRange
            }
            if !(arr.contains(course.lowercased())) {
                throw MyExceptions.InvalidCourseException
            }
            for ascii in name.utf8 {
                if !(ascii >= 97 && ascii <= 122) && !(ascii >= 65 && ascii  <= 90) {
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

while(true){
    print("ENTER THE STUDENT ROLLNO\n")
    let roll = readLine()
    print("ENTER THE STUDENT NAME\n")
    let name = readLine()
    print("ENTER THE STUDENT AGE\n")
    let age = Int(readLine()!)!
    print("ENTER THE COURSE NAME\n")
    let course = readLine()

    var stud: Student = Student(rollno: roll!, name: name!, age: age, course: course!)

}
