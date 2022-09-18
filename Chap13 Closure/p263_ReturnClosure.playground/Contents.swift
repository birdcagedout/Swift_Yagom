//import UIKit

// 클로저를 리턴하는 함수
func makeIncrementer(by amount: Int) -> (() -> Int) {
	var runningTotal = 0
	
	func incrementer() -> Int {
		runningTotal += amount
		return runningTotal
	}
	
	return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(by: 2)
let incrementByTwo2: (() -> Int) = makeIncrementer(by: 2)
let incrementByFive: (() -> Int) = makeIncrementer(by: 5)

let by2_1: Int = incrementByTwo()		// 2
let by2_2: Int = incrementByTwo()		// 4
let by2_3: Int = incrementByTwo()		// 6

let by2_a: Int = incrementByTwo2()		// 2
let by2_b: Int = incrementByTwo2()		// 4
let by2_c: Int = incrementByTwo2()		// 6
let by2_d: Int = incrementByTwo2()		// 8

let by5_1: Int = incrementByFive()		// 5
let by5_2: Int = incrementByFive()		// 10
let by5_3: Int = incrementByFive()		// 15



// 위의 예에서 클로저를 상수에 저장했는데도 호출할 때마다 값이 변하는 이유 ==> 클로저/함수는 모두 참조 타입이기 때문
// 즉, 클로저의 참조를 상수A와 상수B에 할당하면 A, B는 같은 클로저를 가리킨다.
let incByTwo: (() -> Int) = makeIncrementer(by: 2)
let sameThing: (() -> Int) = incByTwo

let a1: Int = incByTwo()				// 2
let a2: Int = incByTwo()				// 4
let a3: Int = incByTwo()				// 6
let a4: Int = incByTwo()				// 8

let b1: Int = sameThing()				// 10
let b2: Int = sameThing()				// 12
let b3: Int = sameThing()				// 14
let b4: Int = sameThing()				// 16
