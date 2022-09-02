import UIKit

// 간단한 함수
func hello(to: String) -> String {
	return "Hello \(to)"
}
let helloToYagom: String = hello(to: "Yagom")
//print(helloToYagom)


// 1. 매개변수 이름(Parameter name) : 호출시 사용 + 함수 내부에서 사용
func helloParameter(myName: String, yourName: String) -> String {
	return "Hello \(yourName), I'm \(myName)"
}
//print(helloParameter(myName: "Muzom", yourName: "Yagom"))


// 2. 전달인자 레이블(Argument Label) : 호출시에만 사용O + 함수 내부에서 사용X
func helloLabel(from myName: String, to yourName: String) -> String {
	return "Hello \(yourName), I'm \(myName)"
}
//print(helloLabel(from: "Muzom", to: "Yagom"))				// OK
//print(hello(myName: "Muzom", yourName: "Yagom"))		// ncorrect argument labels in call (have 'myName:yourName:', expected 'from:to:')


// 3. 호출시 간단하게 : 전달인자 레이블, 매개변수 이름 사용 안 하기
func helloSimple(_ myName: String, _ yourName: String) -> String {
	return "Hello \(yourName), I'm \(myName)"
}
//print(helloSimple("Crazy", "Good"))					// 아예 생략 가능
//print(helloSimple(_: "Crazy", _: "Good"))				// _: 써도 가능
//print(helloSimple(myName: "Crazy", yourName: "Good"))	// Extraneous argument labels 'myName:yourName:' in call


// 가변 매개변수 #1
func helloToFriends(from me: String, to friends: String ...) -> String {
	var result: String = "Hello~ "
	
	for name in friends {
		result += name + ", "
	}
	
	result += "I am \(me)!!"
	return result
}
//print(helloToFriends(from: "Muzom", to: "Yagom", "NulProgrammer", "Kim"))


// 가변 매개변수 #2
func getMean(_ numbers: Double...) -> Double {
	var result: Double = 0
	
	for num in numbers {
		result += num
	}
	
	return result / Double(numbers.count)
}
//print(getMean(1,2,3,4,5))
//print(getMean())



// 입출력 매개변수: 함수정의에 inout, 함수호출에 &
func swapInt(_ num1: inout Int, _ num2: inout Int) {
	let temp = num1
	num1 = num2
	num2 = temp
}

var number1: Int = 0
var number2: Int = 10
//print(number1, number2)				// 0 10
//swapInt(&number1, &number2)
//print(number1, number2)				// 10 0

