import Cocoa

// 1. generic으로 stack 구조체 만들기

struct Stack<Element> {
	var itemList: [Element] = [Element]()
	
	mutating func push(_ item: Element) {
		self.itemList.append(item)
	}
	
	mutating func pop() -> Element {
		return self.itemList.removeLast()
	}
}

// Int형 값들만 넣을 수 있는 Stack
var intStack: Stack<Int> = Stack<Int>()
//var i1: Int = 10, i2: Int = 20, i3: Int = 100
intStack.push(10)
intStack.push(100)
intStack.push(1000)

//print(intStack.pop())						// 1000
//print(intStack.pop())						// 100
//print(intStack.pop())						// 10


// 어떤 값도 넣을 수 있는 Stack : generic + Any의 유용함
var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(10)
anyStack.push(20.0)
anyStack.push("1000")

//print(anyStack.pop())						// 1000
//print(anyStack.pop())						// 20.0
//print(anyStack.pop())						// 10






// 2. generic을 extension으로 확장
//    - 타입 매개변수 명시 금지 ==> Element를 찾을 수 없다는 에러
//    - 하지만 extension 내부에서는 원래 명시했던 타입의 이름을 사용 가능

extension Stack {
	var firstElement: Element? {
		return self.itemList.first
	}
	
	var lastElement: Element? {
		return self.itemList.last
	}
}




// 3. 타입 제한: 클래스 제한 또는 프로토콜 준수 제한

// 3-1. 그냥 정의: - 연산자 적용가능한 타입이어야 함 ==> 에러 발생
//func sub2Value<T>(_ a: T, _ b: T) -> T {
//	return a - b											// Binary operator '-' cannot be applied to two 'T' operands
//}


// 3-2. - 연산자 적용 가능한 타입(프로토콜)으로 정의 ==> Int형만 가능
func sub2Value<T: BinaryInteger>(_ a: T, _ b: T) -> T {
	return a - b
}
//print(sub2Value(10, 20))


// 3-3. Int와 Double 모두 적용 가능한 타입(프로토콜)로 정의 ==> 2가지 프로토콜을 모두 만족하는 기본타입은 없다 ==> 실행시 에러
func sub2Value2<T: BinaryInteger>(_ a: T, _ b: T) -> T where T:FloatingPoint {
	return a - b
}
//print(sub2Value2(10, 20))									// Global function 'sub2Value2' requires that 'Int' conform to 'FloatingPoint'







// 4. 타입 매개변수 여러개 + 각 타입의 제약조건 다를 때
func makeDictionary <Key: Hashable, Value> (key: Key, value: Value) -> Dictionary<Key, Value> {
	var dict: Dictionary<Key, Value> = [key: value]
	return dict
}

var myDict: Dictionary<String, Int> = makeDictionary(key: "A", value: 1)
print(myDict)
myDict["B"] = 2
print(myDict)

