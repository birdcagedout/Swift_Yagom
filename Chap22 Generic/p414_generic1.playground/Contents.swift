import Cocoa

// generic: C++의 template


// 1-1. 연산자 정의: Int에 대해 제곱 연산자 정의 ==> Int 외의 타입에 대해 적용 불가
prefix operator **

prefix func ** (value: Int) -> Int {
	return value * value
}

let minus5: Int = -5
let squaredMinus5: Int = **minus5

//print(squaredMinus5)							// 25

//let uPlus5: UInt = 5
//let uSquaredPlus5: UInt = **uPlus5			// 에러




// 1-2. 제네릭을 사용하여 연산 정의 + 정수 타입 프로토콜 BinaryInteger를 타입으로 사용
prefix operator ***

prefix func *** <T: BinaryInteger> (value: T) -> T {
	return value * value
}

let iMinus5: Int = -5
let uPlus5: UInt = 5

let squarediMinus5: Int = ***iMinus5
let squareduPlus5: UInt = ***uPlus5

//print(squarediMinus5)							// 25
//print(squareduPlus5)							// 25





// 2-1. swap2Int, swap2String, swap2Double ==> 함수 1개당 하나의 타입만 적용 가능하다는 한계가 있다.
func swap2Int(a: inout Int, b: inout Int) {
	let temp: Int = a
	a = b
	b = temp
}

func swap2Double(a: inout Double, b: inout Double) {
	let temp: Double = a
	a = b
	b = temp
}

func swap2String(a: inout String, b: inout String) {
	let temp: String = a
	a = b
	b = temp
}

var i1: Int = 10, i2: Int = 20
swap2Int(a: &i1, b: &i2)

var d1: Double = 10.0, d2: Double = 20.0
swap2Double(a: &d1, b: &d2)

var s1: String = "A", s2: String = "B"
swap2String(a: &s1, b: &s2)

print(i1, i2)
print(d1, d2)
print(s1, s2)





// 2-2. swap함수를 Any로 구현하면 여러가지 타입으로 구현가능??
func swap2Any(a: inout Any, b: inout Any) {
	let temp: Any = a
	a = b
	b = temp
}

var i1any: Int = 10, i2any: Int = 20
swap2Any(a: &i1any, b: &i2any)

var d1any: Double = 10.0, d2any: Double = 20.0
swap2Any(a: &d1any, b: &d2any)

var s1any: String = "A", s2any: String = "B"
swap2Any(a: &s1any, b: &s2any)

print(i1any, i2any)
print(d1any, d2any)
print(s1any, s2any)
