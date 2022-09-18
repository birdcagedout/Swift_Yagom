import UIKit

// 데이터 타입으로서의 함수
// 공식문서 설명: https://docs.swift.org/swift-book/LanguageGuide/Functions.html

// I. 함수의 type에 관한 실험

typealias Calc2Int = (Int, Int) -> Int						// Int 2개 받아서 Int 리턴하는 함수 type 이름을 정의

func add2Int(_ a: Int, _ b: Int) -> Int {
	return a + b
}

func sub2Int(_ a: Int, _ b: Int = 0) -> Int {				// 기본 매개변수는 type에 영향주지 않는다
	return a - b
}

func mul2Int(_ a: Int, _ b: Int...) -> Int {				// 가변 매개변수는 type에 영향 준다
	var result: Int = a
	for num in b {
		result *= num
	}
	return result
}

func swap2Int(_ a: inout Int, _ b: inout Int) -> Int {		// In-out 함수는 type에 영향 준다.
	let temp: Int = a
	a = b
	b = temp
	return 1
}


var function: Calc2Int			// 함수 담을 변수

// 1. add 함수
function = add2Int
//print(function(10, 5))		// 15

// 2. sub 함수
function = sub2Int
//print(function(10, 5))		// 5

// 3. mul 함수
//function = mul2Int			// 가변 매개변수 함수는 type이 달라서 할당할 수 없다.

// 4. swap 함수
//function = swap2Int			// In-out 함수는 type이 달라서 할당할 수 없다.




// II. 함수의 Parameter type으로 함수 type 전달하기
func printMathResult(_ mathFunc: (Int, Int) -> (Int), _ a: Int, _ b: Int) -> Void {
	print(mathFunc(a, b))
}

//printMathResult(add2Int, 20, 1)




// III. 함수의 return type으로 함수 type 사용하기
func moveForward(_ currentScore: Int) -> Int {
	return currentScore + 1
}

func moveBackward(_ currentScore: Int) -> Int {
	return currentScore - 1
}

func decideDirection(_ closeTo100: Bool) -> (Int) -> Int {					// 점수가 100에 가까우면 +1, 0에 가까우면 -1
	return closeTo100 ? moveForward : moveBackward
}

func printScore(_ moveFunc: (Int) -> Int, _ currentScore: Int) -> Void {
	print(moveFunc(currentScore))
}


let score1: Int = 99
printScore( decideDirection( abs(100-score1) < abs(0-score1) ), score1)		// 100

let score2: Int = 1
printScore( decideDirection( abs(100-score2) < abs(0-score2) ), score2)		// 0



