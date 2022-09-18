import UIKit

var name: String = "yagom"
var age: Int = 100


var job = "iOS Programmer"
var height = 181.5
 

// print(type(of: job))
// print(type(of: height))
 

var bb: Bool = true
bb.toggle()
// print(bb)
 

var a: Int = Int.random(in: -100...100)
var b: UInt = UInt.random(in: 0...100)
var c: Float = Float.random(in: -1.0...1.0)
var d: Double = Double.random(in: -1.0...1.0)
 

// print(a)
// print(b)
// print(c)
// print(d)
 

var hell: String = "Hello"
// print(hell.lowercased())
// print(hell.isEmpty)
 

var str0: String = "문자열 중간에 \0을 넣으면"
//print(str0)
 

var person: (String, Int, Double) = ("김재형", 43, 190.5)
// print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")
 

var person2: (name:String, age:Int, height:Double) = ("박광수", 45, 120.5)
// print("이름: \(person2.name), 나이: \(person2.age), 신장: \(person2.height)")
// print("이름: \(person2.0), 나이: \(person2.1), 신장: \(person2.2)")
 

typealias PersonTuple = (name: String, age: Int, height: Double)
 

var p1: PersonTuple = ("박명수", 55, 150.3)
var p2: PersonTuple = ("노홍철", 44, 160.7)
// print("이름: \(p1.name), 나이: \(p1.age), 신장: \(p1.height)")
// print("이름: \(p2.name), 나이: \(p2.age), 신장: \(p2.height)")
 

// 배열 선언 = 2가지
var names1: Array<String> = ["Michael", "Jack", "Dave", "Jenny", "Joey"]
var names2: [String] = ["Michael", "Jack", "Dave", "Jenny", "Joey"]
// print(names1)
// print(names2)
 

// 빈배열 만들기 = 할당 3가지
var emptyArr1: Array<Int> = Array<Int>()
var emptyArr2: Array<Int> = [Int]()
var emptyArr3: Array<Int> = []
 

var emptyArr4: [Int] = Array<Int>()
var emptyArr5: [Int] = [Int]()
var emptyArr6: [Int] = []
 

// print(emptyArr1, emptyArr1.isEmpty, emptyArr1.count)
// print(emptyArr2, emptyArr2.isEmpty, emptyArr2.count)
// print(emptyArr3, emptyArr3.isEmpty, emptyArr3.count)
// print(emptyArr4, emptyArr4.isEmpty, emptyArr4.count)
// print(emptyArr5, emptyArr5.isEmpty, emptyArr5.count)
// print(emptyArr6, emptyArr6.isEmpty, emptyArr6.count)
 

// 배열 프로퍼티/메소드
var names: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]
//print(names[2])
names[2] = "jenny"
//print(names[2])
// names[4] = "else"
 

names.append("elsa")
names.append(contentsOf:["john", "max"])
//print(names)    // ["yagom", "chulsoo", "jenny", "yagom", "elsa", "jinhee", "minsoo"]
names.insert(contentsOf:["jeju", "suwon"], at:7)
//print(names)
 

//print(names.firstIndex(of:"yagom"))
//print(names.firstIndex(of:"Christian"))
//print(names[1...3])


// p.96 딕셔너리 : 선언형식 2가지
var num4name1: Dictionary<String, Int>			// 콤마
var num4name2: [String: Int] = [String: Int]()	// 콜론

// 딕셔너리 : 생성
var num4name3: Dictionary<String, Int> = Dictionary<String, Int>()
var num4name4: [String: Int] = [:]
var num4name5: [String: Int] = ["yagom":100, "chulsoo":200, "jenny":300]

//print(num4name5["chulsoo"])
//num4name5["max"] = 400
//print(num4name5)
//print(num4name5["minji"])				// nil
//print(num4name5["minji", default: 0])	// 0
//
//print(num4name5.removeValue(forKey: "yagom"))		// Optional(100)
//print(num4name5.removeValue(forKey: "yagom"))		// nil
//print(num4name5["yagom", default: -1])			// -1

//print(num4name5.keys)
//print(num4name5.values)


// p.98 Set : 선언형식 1가지 (축약형 없음)
var nameset: Set<String> = Set<String>()

var nameSet: Set<String> = ["yagom", "chulsoo", "younghee", "yagom", "mazinga"]
//print(nameSet)


let engClass: Set<String> = ["john", "chulsoo", "yagom"]
let korClass: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"]

// 교집합 : ["chulsoo", "yagom"]
let intersectSet: Set<String> = engClass.intersection(korClass)
//print(intersectSet.sorted())

// 합집합 : ["chulsoo", "hana", "jenny", "john", "minsoo", "yagom"]
let unionSet: Set<String> = engClass.union(korClass)
//print(unionSet.sorted())

// 차집합1(A-B) : ["john"]
let subtractingSet1: Set<String> = engClass.subtracting(korClass)
//print(subtractingSet1.sorted())

// 차집합2(B-A) : ["hana", "jenny", "minsoo"]
let subtractingSet2: Set<String> = korClass.subtracting(engClass)
//print(subtractingSet2.sorted())

// (A-B)합집합(B-A) : ["hana", "jenny", "john", "minsoo"]
let symmetricDifference: Set<String> = engClass.symmetricDifference(korClass)
//print(symmetricDifference.sorted())


// p.102 열거형
//enum School {
//	case primary
//	case elementary
//	case middle
//	case high
//	case college
//	case university
//	case graduate
//}


var educationLevel1: School = School.university
var educationLevel2: School = .university
//print(educationLevel1 == School.elementary)			// false
//print(educationLevel2 == School.university)			// true
//print(School.university)								// university


enum School: String {
	case primary = "유치원"
	case elementary = "초등학교"
	case middle = "중학교"
	case high = "고등학교"
	case college = "대학"
	case university = "대학교"
	case graduate = "대학원"
}

let educationLevel: School = School.university
//print(educationLevel)						// university
//print(educationLevel.rawValue)				// 대학교



//enum Weekdays: Character {
//	case mon = "월"
//	case tue = "화"
//	case wed = "수"
//	case thu = "목"
//	case fri = "금"
//	case sat = "토"
//	case sun = "일"
//}

let today: Weekdays = Weekdays.fri
//print("오늘은 \(today)요일입니다.")				// 오늘은 fri요일입니다.
//print("오늘은 \(today.rawValue)요일입니다.")		// 오늘은 금요일입니다.



enum Weekdays: Character {
	case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}




// 열거형의 응용

enum PastaTaste: String {
	case cream = "파스타 크림맛", tomato = "파스타 토마토맛"
}

enum PizzaDough: String {
	case cheeseCrust = "피자치즈크러스트도우", thin = "피자얇은도우", original = "피자정통도우"
}

enum PizzaTopping: String {
	case pepperoni = "피자페퍼로니토핑", cheese="피자치즈토핑", bacon = "피자베이컨토핑"
}

enum MainDish {
	case pasta(taste: PastaTaste)
	case pizza(dough: PizzaDough, topping: PizzaTopping)
	case chicken(withSauce: Bool)
	case rice
}


var dinner: MainDish = MainDish.pasta(taste: PastaTaste.cream)
dinner = MainDish.pizza(dough: PizzaDough.thin, topping: PizzaTopping.pepperoni)





