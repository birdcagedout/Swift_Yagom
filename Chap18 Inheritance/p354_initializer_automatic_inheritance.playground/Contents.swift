import Cocoa


// Automatic Initializer Inheritance
// 다음 두가지 경우에는 이니셜라이저가 자동으로 상속된다.
// 1. 자식클래스 프로퍼티에 기본값 있고 + 지정 이니셜라이저 구현이 없을 때 ==> 부모의 지정/편의 이니셜라이저 모두 자동 상속
// 2. 부모의 지정 이니셜라이저를 모두 재정의한 경우 ==> 부모의 편의 이니셜라이저가 모두 상속



// case1. 기본값 있고, 지정 이니셜라이저 구현 없는 경우 ==> 지정/편의 이니셜라이저 자동 상속
class Person1 {
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	convenience init() {
		self.init(name: "Unknown")
	}
}


class Student1: Person1 {
	var major: String = "Swift"
}


let muzom1: Student1 = Student1(name: "muzom1")				// 지정 이니셜라이저 자동 상속
//print(muzom1.name)
let gongnobi1: Student1 = Student1()						// 편의 이니셜라이저 자동 상속
//print(gongnobi1.name)





// case2. 기본값 없으나 이니셜라이저에서 초기화했고, 지정 이니셜라이저 구현한 경우 ==> 편의 이니셜라이저 자동 상속
class Person2 {
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	convenience init() {
		self.init(name: "Unknown")
	}
}


class Student2: Person2 {
	var major: String
	
	override init(name: String) {
		self.major = "Unknown"
		super.init(name: name)
	}
	
	init(name: String, major: String) {						// 다른 지정 이니셜라이저 추가 ==> 자동 상속에 영향 없음
		self.major = major
		super.init(name: name)
	}
}

let muzom2: Student2 = Student2(name: "muzom2")				// override됨
//print(muzom2.name)
let gongnobi2: Student2 = Student2()						// 편의 이니셜라이저 자동 상속
//print(gongnobi2.name)





// case3. 부모의 "지정 이니셜라이저"를 자식이 "편의 이니셜라이저"로 override해도 ==> 편의 이니셜라이저 자동 상속
class Person3 {
	var name: String
	
	init(name: String) {									// 지정 이니셜라이저
		self.name = name
	}
	
	convenience init() {
		print("conv init() 호출됨")
		self.init(name: "Unknown")
	}
}


class Student3: Person3 {
	var major: String
	
	convenience init(major: String) {
		print("conv init(major:) 호출됨")
		self.init()											// 부모의 편의 이니셜라이저가 자동 상속 되었다 ==> 위의 init() 그대로 상속받아 실행하므로 아래 init(name:)을 실행한다.
//		self.major = major
	}
	
	override convenience init(name: String) {				// 부모의 지정 이니셜라이저를 자식이 편의 이니셜라이저로 override ==> 편의 이니셜라이저 자동 상속
		print("override conv init(name:) 호출됨")
		self.init(name: name, major: "Unknown")
	}
	
	init(name: String, major: String) {						// 유일한 지정 이니셜라이저
		print("init(name: major:) 호출됨")
		self.major = major
		super.init(name: name)
	}
}


let muzom3: Student3 = Student3(major: "Swift")				// 실행순서: conv init(major:) ==> conv init() ==> override conv init(name:) ==> init(name: major:)
//print(muzom3.major)
//let gongnobi3: Student3 = Student3()
//print(gongnobi3.name, gongnobi3.major)
