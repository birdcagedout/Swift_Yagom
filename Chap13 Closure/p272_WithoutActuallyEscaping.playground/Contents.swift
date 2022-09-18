//import UIKit

import Foundation

//withoutActuallyEscaping : 함수의 인자로 받은 비탈출 클로저를 함수 내부에서 탈출 클로저로 사용해야 할 필요가 있을 때 사용


// 배열에서 특정 조건의 요소들이 있는지를 true/false로 리턴하는 함수 = hasElements(in: 배열, match: 비탈출 클로저)는 아래와 같이 구현할 수 있다.
// 문제는 이 함수가 처음에 받은 인자는 탈출할 필요가 없어서 비탈출 클로저로 받았는데
// 함수 내부적으로 다른 함수를 call할 때 인자로 받은 클로저가 탈출 클로저여야만 한다는 것이다.

//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//	return (array.lazy.filter {predicate($0)}.isEmpty == false)					// Escaping closure captures non-escaping parameter 'predicate'
//}


// 따라서 아래와 같이 구현 부분을 변경해준다.
func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
	return withoutActuallyEscaping(predicate, do: { escapablePredicate in
		return (array.lazy.filter {escapablePredicate($0)}.isEmpty == false)
	})
}



let numbers: [Int] = [2, 4, 6, 8, 10]

let hasEvenNumbers = hasElements(in: numbers, match: { (number: Int) -> Bool in
	return number % 2 == 0
})

let hasOddNumbers = hasElements(in: numbers, match: { (number: Int) -> Bool in
	return number % 2 == 1
})


print("has Even Numbers: \(hasEvenNumbers)")
print("has Odd Numbers: \(hasOddNumbers)")
