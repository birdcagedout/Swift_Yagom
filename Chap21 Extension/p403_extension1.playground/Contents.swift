import Cocoa


// extension : 모든 타입에, 기능 추가, 재정의 불가




// 1. 연산 프로퍼티 추가
var myInt: Int = 10
//myInt.isEven					// 에러: Value of type 'Int' has no member 'isEven'

extension Int {
	var isEven: Bool {
		return self % 2 == 0
	}
	var isOdd: Bool {
		return self % 2 == 1
	}
}
//print(myInt.isEven)			// T





// 2. 메소드 추가
extension Int {
	func multiply(by n: Int) -> Int {
		return self * n
	}
	mutating func getSquared() {
		self = self.multiply(by: self)
	}
	static func isInt(_ instance: Any) -> Bool {
		return instance is Int
	}
}

var yourInt: Int = myInt.multiply(by: 2)
//print(yourInt)				// 20
//yourInt.getSquared()
//print(yourInt)				// 400
//print(Int.isInt(yourInt))		// T
//print(Int.isInt(3.0))			// F
//print(Int.isInt("Hello"))		// F





// 2-1. 연산자(메소드로서의) 추가
//      1) global로 선언(없었던 operator인 경우)
//      2) extension으로 해당 타입에 static으로 정의


//myInt++						// error: cannot find operator '++' in scope; did you mean '+= 1'?
postfix operator ++				// 새로운 연산자 정의를 위한 "후위 연산자 ++" 선언

extension Int {
	static postfix func ++ (n: inout Int) {		// n은 ++앞에 있는 Int형 instance
		n.self = n.self + 1
	}
}
//print(myInt)					// 10
//myInt++
//print(myInt)					// 11


//++myInt						// error: '++' is not a prefix unary operator
prefix operator ++

extension Int {
	static prefix func ++ (n: inout Int) {		// n은 ++뒤에 있는 Int형 instance
		n.self = n.self + 1
	}
}

//print(myInt)					// 11
//++myInt
//print(myInt)					// 12





// 2-2. 다양한 연산자(메소드로서의) 추가
//prefix operator -
//infix operator +


struct Position {
	var x: Int
	var y: Int
}

extension Position {
	// prefix - 연산( a = -a )
	static prefix func - (vector: Position) -> Position {
		return Position(x: -vector.x, y: -vector.y)
	}
	
	// infix + 연산( a = b + c )
	static /*infix*/ func + (left: Position, right: Position) -> Position {
		return Position(x: left.x + right.x, y: left.y + right.y)
	}
	
	// compound assign += 연산( a += 1 )
	static func += (left: inout Position, right: Position) {
		left = left + right
	}
}

extension Position {
	// == 연산자
	static func == (left: Position, right: Position) -> Bool {
		return (left.x == right.x) && (left.y == right.y)
	}
	
	// != 연산자
	static func != (left: Position, right: Position) -> Bool {
		//return (left.x != right.x) || (left.y != right.y)
		return !(left == right)
	}
}

var myPos: Position = Position(x: 10, y: 10)
var yourPos: Position = Position(x: -5, y: -5)

print(-myPos)					// prefix -
print(myPos + yourPos)			// infix +

myPos += yourPos				// compound assign
print(myPos)

print(myPos == yourPos)			// false
print(myPos != yourPos)			// true
