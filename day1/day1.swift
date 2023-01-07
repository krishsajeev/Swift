import Foundation

enum VehicleType { case electric, petrol, diesel, manpowered }; //Types of class Vehicle.
enum BikeType { case motorbike, scooter, moped}; //Types of class Bike.
enum CarType { case suv, sedan, hatchback }; //Types of class Car.



protocol Vehicle{
    var vehicleType: VehicleType {get set};
    var brand: String {get set};
    var  model: String {get set};
    var colour: String {get set};
    var mileage: Float {get set};
    var price: Int {get set};
    
    
    func type() -> VehicleType
    
    func vehicleBrand() -> String
    
    func vehicleModel() -> String
    
    func vehicleColour() -> String
        
    func vehiclePrice() ->Int
    
    func getNumOfWheels()
    
}

class Bike : Vehicle{
    
    var vehicleType:VehicleType;
    var brand:String;
    var  model:String;
    var colour:String;
    var mileage:Float;
    var price:Int;
    
    var bikeType: BikeType;
    var weight: Float;

    public init( vehicleType: VehicleType, bikeType: BikeType,  brand: String, model: String, colour: String, mileage: Float, price: Int, weight: Float) {
        self.weight = weight;
        self.bikeType = bikeType;
        
        self.vehicleType = vehicleType;
        self.brand = brand;
        self.model = model;
        self.colour = colour;
        self.mileage = mileage;
        self.price = price;
    }
    
    public func type() -> VehicleType
    {
        return self.vehicleType;
    }
    
    public func vehicleBrand() -> String
    {
        return self.brand;
    }
    public func vehicleModel() -> String
    {
        return self.model;
    }
    
    public func vehicleColour() -> String
    {
        return self.colour;
    }
        
    public func vehiclePrice() ->Int
    {
        return self.price;
    }
    
    func getNumOfWheels()
    {
            print(2)
    }
}

class Car : Vehicle{
    
    var vehicleType:VehicleType;
    var brand:String;
    var  model:String;
    var colour:String;
    var mileage:Float;
    var price:Int;
    
    var carType: CarType;
    var numPersons: Int;

    public init( vehicleType: VehicleType, carType: CarType,  brand: String, model: String, colour: String, mileage: Float, price: Int,  numPersons: Int) {
        self.numPersons = numPersons;
        self.carType = carType;
        
        self.vehicleType = vehicleType;
        self.brand = brand;
        self.model = model;
        self.colour = colour;
        self.mileage = mileage;
        self.price = price;
    }
    
    public func type() -> VehicleType
    {
        return self.vehicleType;
    }
    
    public func vehicleBrand() -> String
    {
        return self.brand;
    }
    public func vehicleModel() -> String
    {
        return self.model;
    }
    
    public func vehicleColour() -> String
    {
        return self.colour;
    }
        
    public func vehiclePrice() ->Int
    {
        return self.price;
    }
    
    func getNumOfWheels()
    {
            print(4)
    }
}

//Overloading print() instead of <<
func print(items: Vehicle, separator: String = " ", terminator: String = "\n") {
    Swift.print("BRAND:", items.vehicleBrand(),"\nVEHICLEMODEL:", items.vehicleModel(),"\nTYPE:", items.type(),"\nVEHICLE COLOUR:",  items.vehicleColour(),"\nVEHICLEPRICE:", items.vehiclePrice(),separator: " ")
}

//Overloading <
func < (lhs: Vehicle, rhs: Vehicle) -> Bool
{
    return lhs.vehiclePrice() < rhs.vehiclePrice();
}

//Overloading >
func > (lhs: Vehicle, rhs: Vehicle) -> Bool
{
    return lhs.vehiclePrice() > rhs.vehiclePrice();
}

//create objects
var tvsScooty = Bike( vehicleType: VehicleType.petrol, bikeType: BikeType.scooter, brand: "tvs", model: "scooty", colour: "red", mileage: 20.2, price: 9, weight: 45 );
var fordMustang = Car( vehicleType: VehicleType.diesel, carType: CarType.suv, brand: "ford", model: "mustang", colour: "blue", mileage: 13.1, price: 999, numPersons: 4 );
var heroHonda = Bike( vehicleType: VehicleType.petrol, bikeType: BikeType.motorbike, brand: "hero", model: "splendor", colour:" black", mileage: 60, price: 86, weight: 78.4 );


//call getNumOfWheels function.
tvsScooty.getNumOfWheels();
fordMustang.getNumOfWheels();
heroHonda.getNumOfWheels();

print("\n\n")

//Function overloading for print()
print(items: tvsScooty)
print(items: fordMustang)
print(items: heroHonda)

print("\n\n")

//Operator overloading for < and > operator
var result: String

result = ( heroHonda < fordMustang ) ? "FORD MUSTANG IS COSTLIER THAN HERO HONDA" : "FORD MUSTANG IS CHEAPER THAN HERO HONDA"

print(result)

result = ( tvsScooty < heroHonda ) ? "HERO HONDA IS COSTLIER THAN TVS SCOOTY" : "HERO HONDA IS CHEAPER THAN TVS SCOOTY"
print(result)

result = ( tvsScooty > fordMustang ) ? "FORD MUSTANG IS CHEAPER THAN TVS SCOOTY" : "FORD MUSTANG IS COSTLIER THAN TVS SCOOTY"
print(result)
