import Cocoa


// 클래스의 상속 관점에서 본 이니셜라이저
// 1. 지정 이니셜라이저(init)
// 2. 편의 이니셜라이저(convenience init)


// 초기화 순서
// - 현재 클래스의 프로퍼티 모두 초기화
// - superclass의 프로퍼티 모두 초기화
// - 이후에는 superclass의 프로퍼티 값 변경, 메소드 호출 가능

class Person {
	var name: String
	var age: Int
	
	init(name: String, age: Int) {				// superclass의 유일한 지정 이니셜라이저
		self.name = name
		self.age = age
	}
	
	convenience init(name: String) {			// 편리 이니셜라이저
		self.init(name: name, age: 0)
	}
}


class Student: Person {
	var major: String
	
	override init(name: String, age: Int) {		// 시그니처가 같은 지정 이니셜라이저 ==> override 필수
		self.major = "Swift"
		super.init(name: name, age: age)
	}
	
	init(age: Int) {							// 시그니처가 다른 지정 이니셜라이저 ==> superclass에서 구현하지 않았으므로 override X (쓰면 에러)
		self.major = "Swift"
		super.init(name: "", age: age)
	}
	
	init(name: String) {						// superclass의 편리 이니셜라이저 ==> override 하더라도 override X (쓰면 에러)
		self.major = "Swift"
		super.init(name: name, age: 100)
	}
	
	init() {									// default 이니셜라이저 ==> superclass에서 구현하지 않았으므로 override X (쓰면 에러)
		self.major = "Swift"
		super.init(name: "", age: 100)
		super.name = "Empty"					// super.init() 이후에만 super에서 상속된 프로퍼티 값 변경 가능
	}
	
//	convenience init(name: String) {			// superclass의 편리 이니셜라이저 ==> override 하더라도 override X (쓰면 에러)
//		self.init(name: name, age: 7)
//	}
}


var muzom1: Student = Student(name: "muzom1", age: 10)
var muzom2: Student = Student(age: 44)
var muzom3: Student = Student(name: "muzom3")
var muzom4: Student = Student()
var muzom5: Student = Student(name: "convenient")

print("muzom1.name: \(muzom1.name), muzom1.age: \(muzom1.age)")
print("muzom2.name: \(muzom2.name), muzom2.age: \(muzom2.age)")
print("muzom3.name: \(muzom3.name), muzom3.age: \(muzom3.age)")
print("muzom4.name: \(muzom4.name), muzom4.age: \(muzom4.age)")
print("muzom5.name: \(muzom5.name), muzom5.age: \(muzom5.age)")
