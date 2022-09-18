import Cocoa


// 1. Protocol의 연관 타입(Associated Type)
//    ==> "프로토콜 구현"에 필요한 "연관타입"을 미리 선언하고, 그 "연관타입" 이름을 구현부에서 실제 사용

protocol Container {
	associatedtype ItemType							// 연관 타입을 선언: 이후 구현부에서 ItemType을 사용
	
	var count: Int { get }
	mutating func append(_ item: ItemType)
	subscript(i: Int) -> ItemType { get }
}


// Container 프로토콜을 구현하는 class 작성
class MyContainer: Container {
	var items: Array<Int> = Array<Int>()
	var count: Int {
		return items.count
	}
	
	func append(_ item: Int) {
		items.append(item)
	}
	
	subscript(i: Int) -> Int {
		return items[i]
	}
}


// Container 프로토콜을 구현하는 struct 작성 ==> ItemType에 대응되는 타입(Int)을 직접 입력
struct IntStack: Container {
	var items: [Int] = [Int]()
	
	mutating func push(_ item: Int) {
		items.append(item)
	}
	
	mutating func pop() -> Int {
		return items.removeLast()
	}
	
	// 이제부턴 Container 구현부
	var count: Int {
		return self.items.count
	}
	
	mutating func append(_ item: Int) {
		self.push(item)
	}
	
	subscript(i: Int) -> Int {
		return items[i]
	}
}


// Container 프로토콜을 구현하는 struct 작성 ==> ItemType에 대응되는 타입(Int)을 typealias로 선언
struct IntStack2: Container {
	typealias ItemType = Int						// 이 부분에서 타입 설정 해놓으면 나머지 부분은 코드 재사용 가능 (나중에 ItemType = String도 가능)
	
	var items: [ItemType] = [ItemType]()
	
	mutating func push(_ item: ItemType) {
		items.append(item)
	}
	
	mutating func pop() -> ItemType {
		return items.removeLast()
	}
	
	// 이제부턴 Container 구현부
	var count: Int {
		return self.items.count
	}
	
	mutating func append(_ item: ItemType) {
		self.push(item)
	}
	
	subscript(i: Int) -> ItemType {
		return items[i]
	}
}







// 2. 제네릭을 활용한 subscript: myArray[0...2]와 같은 표현식이 가능하도록 구현해본다.


// 이전 코드 필요해서 붙여넣음
struct Stack<Element> {
	var itemList: [Element] = [Element]()
	
	mutating func push(_ item: Element) {
		self.itemList.append(item)
	}
	
	mutating func pop() -> Element {
		return self.itemList.removeLast()
	}
}

// 책에 있는 코드에서 에러 남
//extension Stack {
//	subscript<Indices: Sequence> (i: Indices) -> [Element] where Indices.Iterator.Element == Int {
//		var result = [Element]()
//
//		for index in i {
//			result.append(contentsOf: self[index])
//		}
//		return result
//	}
//}
