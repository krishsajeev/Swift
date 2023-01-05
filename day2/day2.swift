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
 
 
class ICICI: Bank, Loan {
    var issuingBank: String
    var loantype: LoanType
    var interestRate: Float
    var documentRequired: String
    
    
    var bankType: BankType
    var name: String
    var establishedDate: String
    var branchName: String
    
    
    init(type: LoanType, interestRate: Float, documentRequired: String, bankType: BankType, name: String, establishedDate: String, branchName: String) {
        self.loantype = type
        self.interestRate = interestRate
        self.documentRequired = documentRequired
        self.bankType = bankType
        self.name = name
        self.establishedDate = establishedDate
        self.branchName = branchName
        self.issuingBank = name
    }
    
    
    func getType() -> LoanType{
        return loantype
    }
    
    func getInterestRate() -> Float{
        return interestRate
    }
    
    func getDocumentRequired() -> String{
        return documentRequired
    }
    
    func getName() -> String{
        return name
    }
    
    func getEstablishedDate() -> String{
        return establishedDate
    }
    
    func getBranchName() -> String{
        return branchName
    }
    
}
 
class HDFC: Bank, Loan {
    
    var issuingBank: String
    var loantype: LoanType
    var interestRate: Float
    var documentRequired: String
    
    var bankType: BankType
    var name: String
    var establishedDate: String
    var branchName: String
    
    init(type: LoanType, interestRate: Float, documentRequired: String, bankType: BankType, name: String, establishedDate: String, branchName: String) {
        self.loantype = type
        self.interestRate = interestRate
        self.documentRequired = documentRequired
        self.bankType = bankType
        self.name = name
        self.establishedDate = establishedDate
        self.branchName = branchName
        self.issuingBank = name
    }
    
    func getType() -> LoanType{
        return loantype
    }
    
    func getInterestRate() -> Float{
        return interestRate
    }
    
    func getDocumentRequired() -> String{
        return documentRequired
    }
    
    func getName() -> String{
        return name
    }
    
    func getEstablishedDate() -> String{
        return establishedDate
    }
    
    func getBranchName() -> String{
        return branchName
    }
    
    
}

class SBI: Bank, Loan {
    
    var issuingBank: String
    var loantype: LoanType
    var interestRate: Float
    var documentRequired: String
    
    var bankType: BankType
    var name: String
    var establishedDate: String
    var branchName: String
    
    init(type: LoanType, interestRate: Float, documentRequired: String, bankType: BankType, name: String, establishedDate: String, branchName: String) {
        self.loantype = type
        self.interestRate = interestRate
        self.documentRequired = documentRequired
        self.bankType = bankType
        self.name = name
        self.establishedDate = establishedDate
        self.branchName = branchName
        self.issuingBank = name
    }
    
    func getType() -> LoanType{
        return loantype
    }
    
    func getInterestRate() -> Float{
        return interestRate
    }
    
    func getDocumentRequired() -> String{
        return documentRequired
    }
    
    func getName() -> String{
        return name
    }
    
    func getEstablishedDate() -> String{
        return establishedDate
    }
    
    func getBranchName() -> String{
        return branchName
    }
    
}

class Broker {
    //Overloaded printer functions
    func printer(banks: Bank) {
        print(banks.getName(), banks.getEstablishedDate(), banks.getBranchName())
    }
    
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
        for i in stride(from: 1, to: 10, by: 2) {
            temp = comparer(loan1: temp, loan2: loan1[i])
        }
        return temp
    }
    
}

//Create objects of various banks and their issued loans
var sbi = SBI(type: LoanType.goldLoan, interestRate: 45.6, documentRequired: "GOLD DOCUMENTS", bankType: BankType.publicSector, name: "SBI", establishedDate: "jan 1994", branchName: "chennai")

var icici = ICICI(type: LoanType.landLoan, interestRate: 32.4, documentRequired: "LAND DOCUMENTS", bankType: BankType.privateSector, name: "ICICI", establishedDate: "feb 2001", branchName: "madurai")

var hdfc = HDFC(type: LoanType.personalLoan, interestRate: 12.2, documentRequired: "SALARY DOCUMENTS", bankType: BankType.privateSector, name: "HDFC", establishedDate: "aug 2005", branchName: "comibatore")

//Create Broker object
var b = Broker()

// Print details of single bank
b.printer(banks: sbi)

//print details of multiple banks
b.printer(banks: sbi, icici, hdfc)

var l = b.comparer(loan1: icici, loan2: hdfc)
b.printResult(loan: l)

l = b.comparer(loan1: icici, loan2: hdfc, loan3: sbi)
b.printResult(loan: l)

var arr = [Loan] ()
arr.append(sbi)
arr.append(icici)
arr.append(hdfc)

l = b.comparer(loan1: icici, loan2: hdfc)
b.printResult(loan: l)
