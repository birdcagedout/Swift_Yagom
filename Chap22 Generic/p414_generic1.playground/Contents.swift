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

//print(i1, i2)						// 20 10
//print(d1, d2)						// 20.0 10.0
//print(s1, s2)						// B A





// 2-2. swap함수를 Any로 구현하면 여러가지 타입으로 구현가능??
func swap2Any(a: inout Any, b: inout Any) {
	let temp: Any = a
	a = b
	b = temp
}

var i1any: Any = 10, i2any: Any = 20
swap2Any(a: &i1any, b: &i2any)

var d1any: Any = 10.0, d2any: Any = 20.0
swap2Any(a: &d1any, b: &d2any)

var s1any: Any = "A", s2any: Any = "B"
swap2Any(a: &s1any, b: &s2any)

//print(i1any, i2any)
//print(d1any, d2any)
//print(s1any, s2any)
//
//print(i1any, s2any)					// 20 A

// 문제점
// 1. 변수를 Any로 선언해야 한다. (원래 변수 타입인 Int, Double 등으로 호출하면 에러)
// 2. 같은 타입 변수 2개끼리만 값을 바꾸는 것이 원래 목적 ==> 서로 다른 타입 2개를 바꾸게 되는 경우는 에러 상황이지만 에러 발생 X





// 3. generic으로 함수를 만들면 어떨까?
//    - 원래 변수 타입 그대로 호출 가능
//    - 인자를 같은 타입으로만 제한 가능

func swap2generic <T> (a: inout T, b: inout T) {
	let temp: T = a
	a = b
	b = temp
}

var n1: Int = 10, n2: Int = 100
swap2generic(a: &n1, b: &n2)

var str1: String = "A", str2: String = "B"
swap2generic(a: &str1, b: &str2)

print(n1, n2)
print(str1, str2)

//swap2generic(a: &n1, b: &str1)			// 인자가 같은 타입이 아니라면 에러: Cannot convert value of type 'String' to expected argument type 'Int'


// 스위프트 표준 라이브러리에 이미 swap함수 구현되어 있다.
swap(&n1, &n2)
print(n1, n2)




