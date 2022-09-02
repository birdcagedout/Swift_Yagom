//import UIKit


let names: [String] = ["muzom", "gongnobi", "yagom", "jenny"]

// 1. 후행 클로저

// 1-1. 후행 클로저(Trailing Closure) 기본형태
let reversed1: [String] = names.sorted() { (first: String, second: String) -> Bool in
	return first > second
}

// 1-2. 후행 클로저(Trailing Closure) 기본형태 + 소괄호 생략
let reversed2: [String] = names.sorted { (first: String, second: String) -> Bool in
	return first > second
}

// 1-3. 여러개 인자 중 마지막 인자에만 후행 클로저(Trailing Closure) 적용 가능 ==> 예는 생략

//print(reversed2)




// 2. 클로저 간소화

// 2-0. 후행 클로저 원래 모습(sorted
let reversed_: [String] = names.sorted() { (first: String, second: String) -> Bool in
	return first > second
}

// 2-1. Type 간소화(매개변수type 생략, 리턴type 생략)
let reversed3: [String] = names.sorted { (first, second) in
	return first > second
}

// 2-2. 인자 이름 간소화(==> $0, $1, ...) + in 생략
let reversed4: [String] = names.sorted {
	return $0 > $1
}

// 2-3. return 생략
let reversed5: [String] = names.sorted {
	$0 > $1
}

// 2-4. 클로저 대신 연산자 사용
let reversed6: [String] = names.sorted(by: >)

print(reversed6)
