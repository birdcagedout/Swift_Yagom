import Cocoa


// 1. Class-only Protocol
protocol Readable {
	func read()
}

protocol Writable {
	func write()
}

protocol ClassOnlyProtocol: AnyObject, Readable, Writable {
}

class SomeClass: ClassOnlyProtocol {
	func read() {}
	func write() {}
}

//struct SomeStruct: ClassOnlyProtocol {			// Non-class type 'SomeStruct' cannot conform to class protocol 'ClassOnlyProtocol'
//	func read() {}
//	func write() {}
//}




// 2. Protocol Compostition
protocol Named {
	var name: String { get }
}

protocol Aged {
	var age: Int { get }
}

struct Person: Named, Aged {
	var name: String
	var age: Int
}

class Car: Named {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

class Truck: Car, Aged {
	var age: Int
	
	init(name: String, age: Int) {
		self.age = age
		super.init(name: name)
	}
}

func celebrateBirthday(to thePerson: Named & Aged) {	// Named를 준수하고, Aged도 준수해야 함
	print("Happy Birthday to \(thePerson.name)!! Now you are \(thePerson.age)-years old.")
}


let muzom: Person = Person(name: "muzom", age: 99)
//celebrateBirthday(to: muzom)

let myCar: Car = Car(name: "Pony2")
//celebrateBirthday(to: myCar)							// error: argument type 'Car' does not conform to expected type 'Aged'

var someVehicle: Car & Aged								// Car 클래스 instance이면서 Aged를 준수해야 함

someVehicle = Truck(name: "PorterIII", age: 10)
//someVehicle = myCar									// Value of type 'Car' does not conform to 'Car & Aged' in assignment





// 3. Protocol Conformance check

protocol HasArea {
	var area: Double { get }
}

class Circle: HasArea {
	let pi = 3.1415927
	var radius: Double
	var area: Double { return pi * radius * radius }
	init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
	var area: Double
	init(area: Double) { self.area = area }
}

class Animal {
	var legs: Int
	init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
	Circle(radius: 2.0),
	Country(area: 243_610),
	Animal(legs: 4)
]

for object in objects {
	if let objectWithArea = object as? HasArea {
		print("Area is \(objectWithArea.area)")
	} else {
		print("Something that doesn't have an area")
	}
}

//Area is 12.5663708
//Area is 243610.0
//Something that doesn't have an area
