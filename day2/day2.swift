import Foundation

enum BankType { case privateSector, publicSector }

protocol Bank {
    var bankType: BankType {get set}
    var name: String {get set}
    var establishedDate: String {get set}
    var branchName: String {get set}
    
    func getName() -> String
    func getEstablishedDate() -> String
    func getBranchName() -> String
}
 
enum LoanType { case goldLoan, landLoan, personalLoan }

protocol Loan {
    var issuingBank: String {get set}
    var loantype: LoanType {get set}
    var interestRate: Float {get set}
    var documentRequired: String {get set}
    
    func getType() -> LoanType
    func getInterestRate() -> Float
    func getDocumentRequired() -> String
}
 
 
class Broker {
    //Overloaded printer functions
    func printer(banks: Bank) {
        print(banks.getName(), banks.getEstablishedDate(), banks.getBranchName())
    }
    
    //Demonstrated Variadic parameter in Swift
    func printer(banks: Bank...) {
        for bank in banks {
            print(bank.getName(), bank.getEstablishedDate(), bank.getBranchName())
        }
    }
    
    func printResult(loan: Loan) {
        print(loan.issuingBank, "PROVIDES", loan.loantype, "AT A LOW INTEREST RATE OF", loan.interestRate, separator:" ")
    }
    
    //Comparer function with variadic parameter
    func comparer(loan1: Loan, loan2: Loan) -> Loan{
        return (loan1.getInterestRate() < loan2.getInterestRate()) ? loan1 : loan2
    }
    
    func comparer(loan1: Loan, loan2: Loan,loan3: Loan) -> Loan{
        return comparer(loan1: comparer(loan1: loan1, loan2: loan2), loan2: loan3)
    }
    
    func comparer(loan1: [Loan]) -> Loan {
        var temp = loan1[0]
        for i in stride(from: 1, to: loan1.count, by: 1) {
            temp = comparer(loan1: temp, loan2: loan1[i])
        }
        return temp
    }
    
}

func getLoanType(name: String) -> LoanType {
    if name.lowercased() == "goldloan" {
        return LoanType.goldLoan
    }
    else if name.lowercased() == "landloan" {
        return LoanType.landLoan
    }
    else if name.lowercased() == "personalloan" {
        return LoanType.personalLoan
    }
    return LoanType.personalLoan
}

func getBankType(name: String) -> BankType {
    if name.lowercased() == "publicsector" {
        return BankType.publicSector
    }
    else if name.lowercased() == "privatesector" {
        return BankType.privateSector
    }
    return BankType.privateSector
}


//Create objects of various banks and their issued loans


print("CREATE SBI OBJECT\n\n")

print("ENNTER INTEREST RATE\n")
var interestRate = Float(readLine()!)!
print("ENTER DOCUMENTS\n")
var documents = readLine()
print("ENTER ESTABLISHED DATE\n")
var estDate = readLine()
print("ENTER BRANCH NAME\n")
var branchName = readLine()
print("ENTER LOAN TYPE\n")
var loanType = readLine()
print("ENTER BANK TYPE\n")
var bankType = readLine()


var sbi = SBI(type: getLoanType(name: loanType!), interestRate: interestRate, documentRequired: documents!, bankType: getBankType(name: bankType!), name: "SBI BANK", establishedDate:  estDate!, branchName: branchName!)

print("CREATE ICICI OBJECT\n\n")
print("ENNTER INTEREST RATE\n")
interestRate = Float(readLine()!)!
print("ENTER DOCUMENTS\n")
documents = readLine()
print("ENTER ESTABLISHED DATE\n")
estDate = readLine()
print("ENTER BRANCH NAME\n")
branchName = readLine()
print("ENTER LOAN TYPE\n")
loanType = readLine()
print("ENTER BANK TYPE\n")
bankType = readLine()

var icici = ICICI(type: getLoanType(name: loanType!), interestRate: interestRate, documentRequired: documents!, bankType: getBankType(name: bankType!), name: "ICICI BANK", establishedDate:  estDate!, branchName: branchName!)


print("CREATE HDFC OBJECT\n\n")

print("ENNTER INTEREST RATE\n")
interestRate = Float(readLine()!)!
print("ENTER DOCUMENTS\n")
documents = readLine()
print("ENTER ESTABLISHED DATE\n")
estDate = readLine()
print("ENTER BRANCH NAME\n")
branchName = readLine()
print("ENTER LOAN TYPE\n")
loanType = readLine()
print("ENTER BANK TYPE\n")
bankType = readLine()

var hdfc = HDFC(type: getLoanType(name: loanType!), interestRate: interestRate, documentRequired: documents!, bankType: getBankType(name: bankType!), name: "HDFC BANK", establishedDate:  estDate!, branchName: branchName!)

print("\nDO YOU WANT TO CREATE BROKER OBJECT? [Y/N]\n")
let option = readLine()
if option!.lowercased() == "y" {
    print("BROKER OBJECT CREATED!\n\n")
}
else{
    print("PROGRAM FINISHED !")
    exit(0)
}

//Create Broker object
var b = Broker()

// Print details of single bank
print("PRINTING DETAILS OF SBI BANK!!!\n")
b.printer(banks: sbi)
print("PRINTING DETAILS OF HDFC BANK!!!\n")
b.printer(banks: hdfc)
print("PRINTING DETAILS OF ICICI BANK!!!\n")
b.printer(banks: icici)


print("PRINTING DETAILS OF MULTIPLE BANK!!!\n")
//print details of multiple banks
b.printer(banks: sbi, icici, hdfc)

print("COMPARING ICICI AND HDFC BANK\n")
var l = b.comparer(loan1: icici, loan2: hdfc)
b.printResult(loan: l)

print("COMPARING ICICI, SBI AND HDFC BANK\n")
l = b.comparer(loan1: icici, loan2: hdfc, loan3: sbi)
b.printResult(loan: l)

print("COMPARING ALL BANKS\n")
var arr = [Loan] ()
arr.append(sbi)
arr.append(icici)
arr.append(hdfc)

l = b.comparer(loan1: arr)
b.printResult(loan: l)
