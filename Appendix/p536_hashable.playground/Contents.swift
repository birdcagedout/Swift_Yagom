import Cocoa


// Hashtable / Hashable 에 대해 알아보기
// Hashtable: https://babbab2.tistory.com/89
// Hashable:  https://babbab2.tistory.com/149




// 1. 간단한 Hashtable 만들어보기

var hashTable: [String?] = .init(repeating: nil, count: 3)		// nil로 초기화된 3개 슬롯을 가진 배열

func hash(key: Int) -> Int {									// key라는 Int값에 나머지 연산으로 index값 리턴
	return key % 3
}

func setIntoHashtable(key: String, value: String) {				// Hashtable에 값 넣기
	guard let keyValue = UnicodeScalar(key)?.value else {		// String을 값으로 바꾸기 위해 UnicodeScalar
		return
	}
	
	let hashAddress = hash(key: Int(keyValue))
	hashTable[hashAddress] = value
}

UnicodeScalar("유")		// 50976 % 3 = 0
UnicodeScalar("박")		// 48149 % 3 = 2
UnicodeScalar("김")		// 44608 % 3 = 1

func getFromHashtable(key: String) -> String? {
	guard let keyValue = UnicodeScalar(key)?.value else {
		return nil
	}
	
	let hashAddress = hash(key: Int(keyValue))
	return hashTable[hashAddress]
}

setIntoHashtable(key: "유", value: "재석")
setIntoHashtable(key: "박", value: "명수")
setIntoHashtable(key: "김", value: "삿갓")

//print(hashTable)								// [Optional("재석"), Optional("삿갓"), Optional("명수")]


// 1-2. 해시값이 중복되면 충돌 발생
//      - Open Hashing: 해당 인덱스에 linked list로 값을 추가 저장
//      - Linear Probing(=Close Hashing): 충돌이 난 주소부터 가장 처음 나오는 빈공간에 그냥 쳐박아두기








// 2. Hashable 구현하기
//    - Hashable 프로토콜을 준수해야만 하는 경우가 있다. ex. Dictionary의 Key에 들어오는 타입
//    - 기본타입은 Hashable을 준수하기 때문에 문제가 발생하지 않는다.
//    - 따라서 기본타입이 아닌 경우에는 Hashable을 준수하기 위해 타입 내부에 특정 기능을 구현해야만 한다.


let myDict0: [String: Int] = ["muzom": 44]		// key가 기본타입(String)인 경우: 기본타입은 모두 Hashable이므로 문제없이 사용할 수 있다.

/*
struct Human {
	let name: String
	let age: Int
}

let myDict: [Human: Int]						// key가 기본타입이 아닌 경우: Type 'Human' does not conform to protocol 'Hashable'
												//                       Human이라는 타입을 어떻게 hash값으로 바꿀지를 모르는 거지...
*/




// 2-1. 열거형

enum Gender {							// 연관값이 없는 경우: 채택조차 할 필요없이 이미 Hashable
	case male
	case female
}

let myDict1: [Gender: Int] = [:]


enum Gender2: Hashable {				// 연관값이 있는 경우: Hashable을 채택해야만 하고 + 연관값의 타입(Int)이 모두 Hashable을 준수해야 한다.
	case male(age: Int)
	case female(age: Int)
}

let myDict2: [Gender2: Int] = [:]



// 2-2. 구조체: 구조체 내 모든 프로퍼티가 기본타입이라면 ==> Hashable을 채택하는 것만으로도 추가구현 없이 준수 끝

struct Human0: Hashable {
	let name: String
	let age: Int
}

let myDict3: [Human0: Int] = [:]




// 2-3. 클래스
//      - Hashable 채택
//      - hash(into hasher: inout Hasher) 구현 (단, 저장 프로퍼티는 모두 Hashable한 타입이어야 한다. 아니라면 extension으로 별도 구현 필요)
//      - static func == (left:right:) -> Bool 구현 (Hashable은 Equatable을 채택하고 있기 때문에 == 까지도 구현해야 한다.)

class Human: Hashable {													// Hashable 채택
	let name: String = ""
	let age: Int = 0
	
	static func == (left: Human, right: Human) -> Bool {				// Equatable 구현
		return left.name == right.name && left.age == right.age
	}
	
	func hash(into hasher: inout Hasher) {								// Hashable 구현
		hasher.combine(name)
		hasher.combine(age)
	}
}

let myDict4: [Human: Int] = [:]
