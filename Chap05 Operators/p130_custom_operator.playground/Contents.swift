import Cocoa


// 연산자 사용자 정의
// 1. 선언
// 2. 구현(정의)




// ex1. (기존에 없던) Int형에 ++전위 연산자 정의
//      없던 연산자이므로 선언 필요

var myInt: Int = 10
//++myInt									// Cannot find operator '++' in scope; did you mean '+= 1'?

prefix operator **							// 연산자 ** 선언 필수 ==> 없으면 에러: Operator implementation without matching operator declaration

prefix func ** (value: Int) -> Int {		// 연산자 ** 구현(정의)
	return value * value
}

//print(**myInt)							// 주의: 리턴값만 제곱
//print(myInt)								//		myInt 값이 제곱으로 변하지는 않는다.




// ex2. 기존재하는 logical NOT 연산자를 String에 중복정의(overloading)
//      (기존재하는 연산자이므로 선언 생략해도 됨)
//prefix operator !							// 기존재하는 연산자이므로 선언 생략 가능

prefix func ! (value: String) -> Bool {		// String 앞에 사용
	return value.isEmpty					// 비어 있으면 true
}

var myString: String = "ABC"
print(!myString)
myString = ""
print(!myString)




// ex3. 중위연산자: "연산자 우선순위 그룹"을 지정할 수 있다. 없으면 DefaultPrecedence 그룹이 됨
infix operator ** : MultiplicationPrecedence	// infix 연산자 **는 원래 없던 연산자 ==> 반드시 선언 필요
                                        		// prefix 연산자 **로 사용할 거면 앞서 ex1에서 이미 선언함 ==> 재선언하면 에러
func ** (left: String, right: String) -> Bool {
	return left.contains(right)
}

let gongnobi: String = "gongnobi28ho"
print(gongnobi ** "nobi")





