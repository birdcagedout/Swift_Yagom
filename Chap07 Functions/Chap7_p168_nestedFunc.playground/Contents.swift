import UIKit


// 함수 안에 또다른 함수를 정의할 수 있다.
// 이럴 경우 내부에 정의된 함수는 외부 함수 scope에서만 사용이 가능하지만(원칙)
// 내부함수를 return하는 경우에는 scope 문제 없이 외부에서도 사용가능하다.


// nested func 없이 구현
func goRight(_ currentPos: Int) -> Int {
	return currentPos + 1
}

func goLeft(_ currentPos: Int) -> Int {
	return currentPos - 1
}

func funcToMove(_ currentPos: Int) -> (Int) -> Int {
	return (currentPos > 0) ? goLeft : goRight
}

var currentPos: Int = 3

let moveToZero: (Int) -> Int = funcToMove(currentPos)

//while currentPos != 0 {
//	print("Current Position: \(currentPos)")
//	currentPos = moveToZero(currentPos)
//}
//print("Current Position: \(currentPos)")



// nested func로 구현
func func2Move(_ currentPos: Int) -> (Int) -> Int {
	//내부함수1
	func goRight(_ currentPos: Int) -> Int {
		return currentPos + 1
	}
	
	// 내부함수2
	func goLeft(_ currentPos: Int) -> Int {
		return currentPos + 1
	}
	
	return (currentPos > 0) ? goLeft : goRight
}

var pos = -3
let moveFunc: (Int) -> Int = func2Move(pos)

while pos != 0 {
	print("Current Position: \(pos)")
	pos = moveFunc(pos)
}
print("Current Position: \(pos)")

