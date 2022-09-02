import UIKit


// Reduce : 컬렉션의 각 요소들을 하나의 값으로 리턴하여 차원을 줄이는 함수
//          2가지 유형이 있다. into 없는 유형과 into 있는 유형
// https://developer.apple.com/documentation/swift/array/reduce(_:_:)

/**
func reduce<Result>(
_ initialResult: Result,
_ nextPartialResult: (Result, Self.Element) throws -> Result
) rethrows -> Result
**/


// 가장 간단한 예
let nums: [Int] = [1, 2, 3, 4]
let numSum = nums.reduce(0, { result, x in
	return result + x
})
//print(numSum)		// 10




// 1. Reduce(초기값, 클로저(누적값, 요소)) -> (최종)리턴값
//                   => 이때의 클로저는 리턴값을 누적시킨다
let numbers: ClosedRange = (1...10)

var sum: Int = numbers.reduce(0, {(result: Int, nextElement: Int) -> Int in
//	print("\(result) + \(nextElement)")
	return result + nextElement				// 클로저에서 리턴한 값이 result 변수로 누적
})
//print(sum)
//0 + 1
//1 + 2
//3 + 3
//6 + 4
//10 + 5
//15 + 6
//21 + 7
//28 + 8
//36 + 9
//45 + 10
//55



// 1-1. reduce 축약형 : trailing closure 사용
let remainder1: Int = numbers.reduce(55) {
//	print("\($0) - \($1)")
	return $0 - $1
}
//print(remainder1)
//55 - 1
//54 - 2
//52 - 3
//49 - 4
//45 - 5
//40 - 6
//34 - 7
//27 - 8
//19 - 9
//10 - 10
//0


// 1-2. reduce를 문자열에 사용하기
let names: [String] = ["Cloe", "Joey", "Elle"]

let reducedNames: String = names.reduce("muzom's friends:", { $0 + " " + $1 })
//print(reducedNames)		// muzom's friends: Cloe Joey Elle






// 2. Reduce(into: 초기값, 클로저(누적값, 요소)) -> (최종)리턴값
//                         => 이때의 클로저는 리턴하지 않고, 연산만으로 result에 누적시킨다
sum = numbers.reduce(into: 0, { (result: inout Int, nextElement: Int) in
//	print("\(result) + \(nextElement)")
	result += nextElement					// 클로저는 리턴하지 않는다.(단지 연산만으로 result에 값을 누적)
})
//print(sum)
//0 + 1
//1 + 2
//3 + 3
//6 + 4
//10 + 5
//15 + 6
//21 + 7
//28 + 8
//36 + 9
//45 + 10
//55



// 2-1. reduce(into:) 축약형
var remainder2: Int = numbers.reduce(into: 65, {
//	print("\($0) - \($1)")
	$0 -= $1
})
//print(remainder2)
//65 - 1
//64 - 2
//62 - 3
//59 - 4
//55 - 5
//50 - 6
//44 - 7
//37 - 8
//29 - 9
//20 - 10
//10



// 2-2. reduce(into:) 형태로 다른 컨테이너(초기값으로 주어지는)에 원래 컨터이너의 값을 변경하여 넣어줄 수도 있다.(필터 + 맵과 같은 효과)
// 빈 배열에 1...10 중 짝수만 *2 해서 넣어준다.
var doubledNum: [Int] = numbers.reduce(into: []) { (result: inout [Int], next: Int) in
//	print("result: \(result),\t next: \(next)")
	
	// 홀수이면 재끼고(리턴)
	guard next.isMultiple(of: 2) else {
		return
	}
	
	// 짝수이면 2배 해서 배열에 넣어줌
//	print("\(result) append \(next)*2")
	result.append(next*2)
//	print("========================")
}
//print(doubledNum)
//result: [],	 next: 1
//result: [],	 next: 2
//[] append 2*2
//========================
//result: [4],	 next: 3
//result: [4],	 next: 4
//[4] append 4*2
//========================
//result: [4, 8],	 next: 5
//result: [4, 8],	 next: 6
//[4, 8] append 6*2
//========================
//result: [4, 8, 12],	 next: 7
//result: [4, 8, 12],	 next: 8
//[4, 8, 12] append 8*2
//========================
//result: [4, 8, 12, 16],	 next: 9
//result: [4, 8, 12, 16],	 next: 10
//[4, 8, 12, 16] append 10*2
//========================
//[4, 8, 12, 16, 20]



// 2-3. 위의 예를 필터와 맵으로 표현
var doubledNUM: [Int] = numbers.filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
//print(doubledNUM)
// [4, 8, 12, 16, 20]



// 2-4. 이름을 모두 대문자로 바꿔서 빈 배열에 저장
//let names: [String] = ["Cloe", "Joey", "Elle"]

var uppercasedNames: [String] = names.reduce(into: []) {
	$0.append($1.uppercased())
}
//print(uppercasedNames)
//["CLOE", "JOEY", "ELLE"]



// 2-5. 위의 예를 맵으로 구현
var upperCasedNAMES: [String] = names.map { $0.uppercased() }
//print(upperCasedNAMES)
//["CLOE", "JOEY", "ELLE"]



// 3. 맵, 필터, 리듀스 모두 연동 예제
//let numbers: ClosedRange = (1...10)

var result: Int = numbers.filter { $0.isMultiple(of: 2) }.map { $0 * $0 }.reduce(0) {
	$0 + $1
}
//print(result)		// 220 = 2^2 + 4^4 + 6^6 + 8^8 + 10^10





// 4. 맵, 필터, 리듀스 모두 연동 예제2

enum Gender {
	case male, female, unknown
}

struct Friend {
	let name: String
	let gender: Gender
	let location: String
	var age: UInt
}


var friends: [Friend] = [Friend]()

friends.append(Friend(name: "A", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "B", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "C", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "D", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "E", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "F", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "G", gender: .male, location: "경기", age: 24))


var condidates: [Friend] = friends.filter {$0.age >= 24 && $0.location != "서울"}

print(condidates)
