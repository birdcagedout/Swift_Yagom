import UIKit

// Optional
// 공식문서: https://bbiguduk.gitbook.io/swift/language-guide-1/the-basics#optionals
// 옵셔널은 2가지 가능성이 있습니다: 값이 있고 옵셔널을 풀어서 값에 접근하거나, 값이 없을(nil) 수도 있습니다.


// Swift의 Int 타입은 String 값을 Int 값으로 변환하는 초기화가 존재합니다. 그러나 모든 문자열을 정수로 변환할 수 없습니다.
// 문자열 "123" 은 숫자값 123 으로 변환될 수 있지만 문자열 "hello, world" 는 변환할 숫자값이 없습니다.
// 따라서 문자열로 초기화된 Int 변수는 2가지 가능성(Int값, 변환실패)이 있으므로 Optional 변수가 된다.
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//print(convertedNumber)							// Optional(123)


// 옵셔널 변수 선언: type 끝에 물음표(?)
// 옵셔널 변수에만 nil을 할당할 수 있다.
var serverResponseCode: Int? = 404
//print(serverResponseCode)							// Optional(404)
serverResponseCode = nil
//print(serverResponseCode)							// nil




enum SchoolString: String {
	case elementary	= "초등학교"	// 초
	case middle		= "중학교"	// 중
	case high		= "고등학교"	// 고
	case university	= "대학교"	// 대학
	case graduate	= "대학원"	// 대학원
}


enum Numbers: Int {
	case Zero			// 묵시적 0
	case one			// 묵시적 1
	case two			// 묵시적 2
	case ten = 10		// 묵시적 10
}


// 아래 예제는 중요: Optional과 nil에 관한 예제

let edu1 = SchoolString(rawValue: "초등학교")				// type 없음에 유의
let edu2 = SchoolString(rawValue: "석박사")
//print(edu1, edu2)										// Optional(__lldb_expr_107.SchoolString.elementary) nil
//print(type(of: edu1), type(of: edu2))					// Optional<SchoolString> Optional<SchoolString>


//let num1: Numbers = Numbers(rawValue: 1)				// Value of optional type 'Numbers?' must be unwrapped to a value of type 'Numbers'
//let num2: Numbers = Numbers(rawValue: 5)				// Value of optional type 'Numbers?' must be unwrapped to a value of type 'Numbers'

let num1 = Numbers(rawValue: 1)
let num2 = Numbers(rawValue: 5)
//print(num1, num2)										// Optional(__lldb_expr_107.Numbers.one) nil
//print(type(of: num1), type(of: num2))					// Optional<Numbers> Optional<Numbers>




// Optional은 열거형으로 선언: none=nil, some=값있음(값=Wrapped)
func checkOptional(value optionalValue: Any?) {
	switch optionalValue {
	case .none:
		print("This Optional variable is nil")
	case .some(let value):
		print("This Optional variable is \(value)")
	}
}

var myName: String? = "yagom"
var yourName: String?
var strName: String = "YOU"
//checkOptional(value: myName)							// This Optional variable is yagom
//checkOptional(value: yourName)						// This Optional variable is nil
//checkOptional(value: strName)							// This Optional variable is YOU ==> Optional이 아닌 String 변수에도 동작함

//if let temp = myName {
//	print("true", type(of: temp))						// true String ==> Optional Binding에 성공하면 "임시변수" temp는 더이상 Optional이 아니라 type추론에 의해 String 타입이 됨
//} else {
//	print("false")
//}


// Optional에 값이 있을 때 + where 조건
let numbers: [Int?] = [2, nil, -4, nil, 100]

//for number in numbers {
//	switch number {
//	case .none:
//		print(".none: nil")
//	case .some(let value) where value < 0:
//		print("Minus: \(value)")
//	case .some(let value) where value < 10:
//		print("Plus: \(value)")
//	case .some(let value) where value >= 10:
//		print("Large: \(value)")
//	case .some(_):										// Switch must be exhaustive : 남은 경우 모두 받아내는 용도
//		continue
//	}
//}


// 옵셔널 바인딩
var hisName: String? = "yagom"

if let name = hisName {
	print("His name is \(name)")
}
else {
	print("His name == nil")
}


// 옵셔널 바인딩 2개 이상 ==> 각각 let + 콤마(,)
// 둘 다 nil이 아닐 때(콤마=AND)만 옵셔널 바인딩 성공
var name1: String? = "yagom"
var name2: String? = nil
var name3: String? = "muzom97"

if let n1 = name1, let n2 = name2 {
	print("name1 and name2 : Optional binding succeeded")
}
else {
	print("name1 and name2 : Optional binding failed")			// 실패
}


if let n1 = name1, let n3 = name3 {
	print("name1 and name3 : Optional binding succeeded")		// 성공
}
else {
	print("name1 and name3 : Optional binding failed")
}



// 암시적 추출 옵셔널 ==> 사용 비추
var nameImplicit: String! = "yagom"
nameImplicit = nil

if let n = nameImplicit {
	print("nameImplicit is \(n)")
	print("type of nameImplicit is \(type(of: nameImplicit))")
}
else {
	print("nameImplicit == nil")								// 실패
	print("type of nameImplicit is \(type(of: nameImplicit))")
}

nameImplicit.isEmpty											// Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
