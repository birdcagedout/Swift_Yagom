//import UIKit

// 탈출 클로저
// 요건1. 어느 함수의 인자로 클로저를 받는다.
// 요건2. 그 함수가 인자로 받은 클로저를 리턴한거나, 또는 (리턴하지 않더라도) 외부변수에 클로저를 저장한다.
// 인자로 받을 때 인자이름 콜론 뒤에 @escaping을 붙인다.(안 붙이면 컴파일 에러)


// 1. 인자로 받은 클로저를 리턴하는 경우

typealias VoidVoidClosure = () -> Void

let firstClosure: VoidVoidClosure = {
	print("Closure A")
}

let secondClosure: VoidVoidClosure = {
	print("Closure B")
}

// 인자로 클로저를 받아서, 리턴하므로 ==> 인자로 받은 클로저는 "탈출 클로저"이다.
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, returnFirstClosure: Bool) -> VoidVoidClosure {
	return returnFirstClosure ? first : second
}

// 인자로 들어가는 클로저는 returnOneClosure 내부에서 정의되지 않았고, 외부에서 정의되었다.
let returnedClosure1: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, returnFirstClosure: true)
returnedClosure1()		// Closure A
let returnedClosure2: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, returnFirstClosure: false)
returnedClosure2()		// Closure B




// 2. 함수 인자로 받은 클로저를 외부 변수에 저장하는 경우

var closureList: [VoidVoidClosure] = []

func appendClosure(closure: @escaping VoidVoidClosure) {
	closureList.append(closure)
}

appendClosure(closure: secondClosure)
appendClosure(closure: firstClosure)
appendClosure(closure: secondClosure)

closureList[0]()		// Closure B
closureList[1]()		// Closure A
closureList[2]()		// Closure B

