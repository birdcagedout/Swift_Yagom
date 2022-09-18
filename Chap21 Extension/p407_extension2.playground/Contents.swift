import Cocoa


// 1. extension으로 클래스 타입에 init 추가

extension String {
	init(intType: Int) {
		self = "\(intType)"
	}
	init(doubleType: Double) {
		self = "\(doubleType)"
	}
}

let stringFromInt: String = String(intType: 100)
let stringFromDouble: String = String(doubleType: 100.0)

class Person {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

extension Person {
	convenience init() {
		self.init(name: "Unknown")
	}
}

let someOne: Person = Person()
//print(someOne.name)								// Unknown





// 2. extension으로 값 타입에 init 추가
//    다음의 2가지를 만족할 때 extention으로 추가한 init 외에 다른 기본 init / 멤버와이즈 init을 call 할 수 있다.
//    - 저장 프로퍼티에 기본값
//    - 기본 init / 멤버와이즈 init 외에 추가로 정의한 init이 없다

struct Size {
	var width: Double = 0.0
	var height: Double = 0.0
}

struct Point {
	var x: Double = 0.0
	var y: Double = 0.0
}

struct Rect {
	var origin: Point = Point()
	var size: Size = Size()
}


let defaultRect: Rect = Rect()
let memberwiseRect: Rect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
	init(center: Point, size: Size) {
		let originX: Double = center.x - (size.width / 2)
		let originY: Double = center.y - (size.height / 2)
		self.init(origin: Point(x: originX, y: originY))
	}
}

let cdnterRect: Rect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
