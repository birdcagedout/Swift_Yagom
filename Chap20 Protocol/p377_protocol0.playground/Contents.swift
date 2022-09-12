import Cocoa

// 프로토콜 Swift 공식문서 예제

// 1. 프로퍼티 요구사항
protocol FullyNamed {
	var fullName: String { get }
}

class Starship: FullyNamed {
	var prefix: String?
	var name: String
	
	init(name: String, prefix: String? = nil) {
		self.name = name
		self.prefix = prefix
	}
	
	var fullName : String {
		return (prefix != nil ? prefix! + " " : "") + name
	}
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")


// 2. 메소드 요구사항
protocol RandomNumberGenerator {
	func random() -> Double			// 0..<1
}

class LinearCongruentialGenerator: RandomNumberGenerator {
	var lastRandom = 42.0
	let m = 139968.0
	let a = 3877.0
	let c = 29573.0
	
	func random() -> Double {
		lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
		return lastRandom / m
	}
}

var generator = LinearCongruentialGenerator()

for _ in 0...10 {
	print("random number: \(generator.random())")
}


