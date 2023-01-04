import Foundation

enum VehicleType { case electric, petrol, diesel, manpowered }; //Types of class Vehicle.
enum BikeType { case motorbike, scooter, moped}; //Types of class Bike.
enum CarType { case suv, sedan, hatchback }; //Types of class Car.



class Vehicle{
    private var vehicleType:VehicleType;
    private var brand:String;
    private var  model:String;
    private var colour:String;
    private var mileage:Float;
    private var price:Int;
    
    public init(vehicleType:VehicleType, brand:String, model:String, colour:String, mileage:Float, price:Int) {
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
    
}

func < (lhs:Vehicle, rhs:Vehicle) -> Bool
{
    return lhs.vehiclePrice() < rhs.vehiclePrice();
}

func > (lhs:Vehicle, rhs:Vehicle) -> Bool
{
    return lhs.vehiclePrice() > rhs.vehiclePrice();
}


class Bike : Vehicle{
    private var bikeType:BikeType;
    private var weight:Float;

    public init( vehicleType:VehicleType, bikeType:BikeType,  brand:String, model:String, colour:String, mileage:Float, price:Int, weight:Float) {
        self.weight = weight;
        self.bikeType = bikeType;
            super.init(vehicleType:vehicleType, brand:brand, model:model, colour:colour, mileage:mileage, price:price)
        }

        func getNumOfWheels()
        {
            print(2)
        }
}

class Car : Vehicle{
    private var carType:CarType;
    private var numPersons:Int;

    public init( vehicleType:VehicleType, carType:CarType,  brand:String, model:String, colour:String, mileage:Float, price:Int,  numPersons:Int) {
            self.numPersons = numPersons;
            self.carType = carType;
            super.init(vehicleType:vehicleType, brand:brand, model:model, colour:colour, mileage:mileage, price:price)
        }

        func getNumOfWheels()
        {
            print(4)
        }
}

func print(items: Vehicle, separator: String = " ", terminator: String = "\n") {
        Swift.print(items.vehicleBrand(), items.vehicleModel(), items.type(), items.vehicleColour(), items.vehiclePrice())
}

//create objects
var tvsScooty = Bike( vehicleType:VehicleType.petrol, bikeType:BikeType.scooter, brand:"tvs", model:"scooty", colour:"red", mileage:20.2, price:9, weight:45 );
var fordMustang = Car( vehicleType:VehicleType.diesel, carType:CarType.suv, brand:"ford", model:"mustang", colour:"blue", mileage:13.1, price:999, numPersons:4 );
var heroHonda = Bike( vehicleType:VehicleType.petrol, bikeType:BikeType.motorbike, brand:"hero", model:"splendor", colour:"black", mileage:60, price:86, weight:78.4 );


//call getNumOfWheels function.
tvsScooty.getNumOfWheels();
fordMustang.getNumOfWheels();
heroHonda.getNumOfWheels();

print(items: tvsScooty)

//Operator overloading for < and > operator
var result:String

result = ( heroHonda < fordMustang ) ? "FORD MUSTANG IS COSTLIER THAN HERO HONDA" : "FORD MUSTANG IS CHEAPER THAN HERO HONDA"

print(result)

result = ( tvsScooty < heroHonda ) ? "HERO HONDA IS COSTLIER THAN TVS SCOOTY" : "HERO HONDA IS CHEAPER THAN TVS SCOOTY"
print(result)

result = ( tvsScooty < fordMustang ) ? "HERO HONDA IS CHEAPER THAN TVS SCOOTY" : "FORD MUSTANG IS COSTLIER THAN TVS SCOOTY"
print(result)
