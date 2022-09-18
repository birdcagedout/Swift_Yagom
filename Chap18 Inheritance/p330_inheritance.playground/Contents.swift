import Cocoa

// 클래스 상속

// base class
class Person {
	var name: String = ""
	var age: Int = 0
	
	var intro: String {
		return "이름: \(name), 나이: \(age)"
	}
	
	func speak() {
		print("가나다라")
	}
}

// subclass / child class
class Student: Person {
	var grade: String = "F"
	
	func study() {
		print("Studying heard")
	}
}


let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 99
print(yagom.intro)
yagom.speak()



// Student 클래스는 Person 클래스를 상속
let muzom: Student = Student()
muzom.name = "muzom"
muzom.age = 44
muzom.grade = "A"

print(muzom.intro)
muzom.speak()
muzom.study()



// subclass of subclass
class UnivStudent: Student {
	var major: String = ""
}


// UnivStudent는 Student를 상속
let gong: UnivStudent = UnivStudent()
gong.major = "Computer Science"
gong.speak()
gong.study()

