import Cocoa


// required init

// desig init에서 super.init() 암시적(자동)으로 call하는 경우: desig init에 인자가 없고 + 2단계 초기화 후 프로퍼티 재정의 없는 경우
// https://forums.swift.org/t/what-are-the-actual-consequences-of-not-calling-super-init-in-an-nsobject-subclasss-designated-initializer/45005/2

class Person1 {
	var name: String
	
	required init() {
		print("Person1의 required init() 호출됨")
		self.name = "Unknown"
	}
}


class Student1: Person1 {
	var major: String = "Unknown_Major"
	
	init(major: String) {
		self.major = major
		super.init()
	}
	
	required init() {
												// 여기에 컴파일러가 super.init() 넣어줌
												// major 초깃값 지워보면 ==> 에러: Property 'self.major' not initialized at implicitly generated super.init call
	}
}

//let muzom: Student1 = Student1()
//print("\(muzom.name), \(muzom.major)")		// Unknown, Unknown_Major


class UnivStudent1: Student1 {
	var grade: String
	
	init(grade: String) {
		self.grade = grade
		super.init()							// 부모의 빈깡통 init()을 호출해도 ==> 컴파일러가 super.init() 넣어줌
	}
	
	required init() {
		self.grade = "F"
		super.init()
	}
}


let jihyun: UnivStudent1 = UnivStudent1(grade: "A")
print("\(jihyun.name), \(jihyun.major), \(jihyun.grade)")		// Unknown, Unknown_Major, A

