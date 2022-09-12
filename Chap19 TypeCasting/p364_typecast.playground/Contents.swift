import Cocoa

// 타입캐스팅: 타입 체크 연산자(is), 타입 캐스트 연산자(as)


class Coffee {
	let name: String
	let shot: Int
	
	var description: String {
		return "\(shot) shot(s) \(name)"
	}
	
	init(shot: Int) {
		self.shot = shot
		self.name = "coffee"
	}
}

class Latte: Coffee {
	var flavor: String
	
	override var description: String {
		return "\(shot) shot(s) \(flavor) latte"
	}
	
	init(flavor: String, shot: Int) {
		self.flavor = flavor
		super.init(shot: shot)
	}
}

class Americano: Coffee {
	let iced: Bool
	
	override var description: String {
		return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"		// 쌍따옴표 안에서 다른 String일 때도 쌍따옴표 사용(홑따옴표=에러)
	}
	
	init(shot: Int, iced: Bool) {
		self.iced = iced
		super.init(shot: shot)
	}
}


let coffee: Coffee = Coffee(shot: 1)
//print(coffee.description)											// 1 shot(s) coffee

let myCoffee: Americano = Americano(shot: 2, iced: false)
//print(myCoffee.description)										// 2 shot(s) hot americano

let yourCoffee: Latte = Latte(flavor: "vanilla", shot: 3)
//print(yourCoffee.description)										// 3 shot(s) vanilla latte


//print(coffee is Coffee)				// T
//print(coffee is Americano)			// F
//print(coffee is Latte)				// F
//
//print(myCoffee is Coffee)			// T
//print(myCoffee is Latte)			// F
//
//print(yourCoffee is Coffee)			// T
//print(yourCoffee is Americano)		// F




// 메타 타입: 어떤 "자료형의 타입" 그 자체를 값으로 표현/저장할 때 사용하는 타입

protocol SomeProtocol {}
class SomeClass {}

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

//someType = intType
//print(someType)				// Int
//
//someType = stringType
//print(someType)				// String
//
//someType = classType
//print(someType)				// SomeClass
//
//someType = protocolProtocol
//print(someType)				// SomeProtocol
//
//print(intType == Int.self)
//print(intType == String.self)


// type(of:)
print(type(of: coffee) == Coffee.self)		// true
print(type(of: coffee).self)				// Coffee


