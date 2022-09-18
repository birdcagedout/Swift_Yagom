import Cocoa


// Overriding(재정의)
// 부모(또는 조상)으로부터 물려받은 프로퍼티/메소드/서브스크립트 등을
// 자식 클래스에서 새롭게 정의하여 사용

// 1. 메소드 overriding
// - 인스턴스 메소드, 타입 메소드 둘 다 가능
// - 매개변수 타입과 개수, 리턴 타입이 모두 일치해야 가능 (다르면 전혀 다른 메소드 정의)


class Person {
	var name: String = ""
	var age: Int = 0
	
	var intro: String {
		return "이름: \(name), 나이: \(age)"
	}
	
	func speak() {
		print("Person이 말합니다.")
	}
	
	class func introduce() -> String {
		return "Person클래스의 introduce() 타입메소드"
	}
}


class Student: Person {
	var grade: String = "F"
	
	func study() {
		print("공부 중입니다.")
	}
	
	override func speak() {
		 print("학생이 말합니다.")
	}
}


class UnivStudent: Student {
	var major: String = ""
	
	// 리턴형이 없는 타입메소드 introduce() ==> 상속받은 메소드가 아니라 UnivStudent 클래스만의 타입메소드
	class func introduce() {
		print(super.introduce())
	}
	
	// 리턴형이 있는 타입메소드 intoduce()  ==> 상속받은 메소드를 오버라이딩
	override class func introduce() -> String {
		return "대학생이 소개합니다."
	}
	
	override func speak() {
		super.speak()
		print("대학생이 말합니다.")
	}
}


let yagom: Student = Student()
//yagom.speak()							// 학생이 말합니다.

let muzom: UnivStudent = UnivStudent()
//muzom.speak()							// 학생이 말합니다. 대학생이 말합니다.

//print(muzom.introduce() as String)		// Static member 'introduce' cannot be used on instance of type 'UnivStudent'
print(UnivStudent.introduce() as String)
