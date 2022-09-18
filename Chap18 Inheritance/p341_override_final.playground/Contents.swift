import Cocoa


// 재정의/상속 방지 : final


// 재정의 방지 : property/method 앞에 final
class Person {
	var name: String = ""
	final func speak() {
		print("Person이 말합니다.")
	}
}


final class Student: Person {
	override var name: String {
		get {
			return super.name		// 왜 self.name이 아니라 super.name인지 고민해볼것.
		}
		set {
			super.name = newValue	// 왜 self.name이 아니라 super.name인지, self.name을 넣으면 어떻게 될지 고민해볼것.
			print("self.name: \(self.name), super.name: \(super.name)")
		}
	}
	
	
//	override func speak() {			// instance method overrides a 'final' instance method
//		print("Student가 말합니다.")
//	}
}


var muzom: Student = Student()
muzom.name = "MUZOM"



class UnivStudent: Student {		// Inheritance from a final class 'Student'
}
