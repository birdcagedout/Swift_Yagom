import Cocoa
//import Foundation		// objc 속성에 필요 ==> But The Foundation(Objective-C framework) is part of the macOS Cocoa API


// 프로토콜의 optional requirements
// 1) 옵셔널 요구사항으로 정의된 것은 "꼭 구현할 필요가 없다." ==> 정의될 수도 있고, 정의 안 될 수도 있다.(그래서 옵셔널)
// 2) 프로토콜과 각각의 옵셔널 요구사항 앞에 @objc 속성을 붙여야 한다.
// 3) 클래스만 되고(Object-C 클래스나 다른 @objc 클래스로부터 상속받은 클래스 only), 구조체/열거형은 채택 불가
// 4) 옵셔널 요구사항으로 구현된 프로퍼티나 메소드는 무조건 옵셔널(메소드 시그너처 타입 자체가 옵셔널로 래핑됨)
// 5) (구현되지 않았을 수 있으므로) 옵셔널 요구사항은 옵셔널 체이닝으로 call 가능


@objc protocol Movable {
	func walk()
	@objc optional func fly()			// 옵셔널 요구사항
}

// 걷기만 하는 호랑이
class Tiger: NSObject, Movable {
	func walk() {
		print("Tiger walks")
	}
}

// 걷고 날 수 있는 새
class Bird: NSObject, Movable {
	func walk() {
		print("Bird walks")
	}
	
	func fly() {
		print("Bird flies")
	}
}


let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()							// 구현됨 guaranteed
bird.walk()								// 구현됨 guaranteed

var movableObject: Movable = tiger
movableObject.fly?()					// 구현됨 NOT guaranteed ==> fly?()

movableObject = bird
movableObject.fly?()					// 구현됨 NOT guaranteed ==> fly?()

