import UIKit


// Subscript
// subscript(index: Int) 형태의 메소드 : 타입/익스텐션의 구현부(implementation of type/extension)에 정의
// 여러개의 매개변수를 가질 수 있고,
// 매개변수 기본값을 가질 수 있고,
// inout 매개변수를 가질 수 없다.

struct Student {
	var name: String
	var number: Int
}

class School {
	var number: Int = 0
	var students: [Student] = [Student]()
	
	func addStudent(name: String) {
		let student: Student = Student(name: name, number: self.number)
		self.students.append(student)
		self.number += 1
	}
	
	func addStudents(names: String...) {
		for name in names {
			self.addStudent(name: name)
		}
	}
	
	subscript(index: Int = 0) -> Student? {
		if index < self.number {
			return self.students[index]
		}
		return nil
	}
}


let highSchool: School = School()
highSchool.addStudents(names: "yagom", "muzom", "gongnobi")


// 클래스 인스턴스에 subscript 적용
let aStudent: Student? = highSchool[1]				// subscript 구현이 없다면 ==> 에러
print("\(aStudent?.number) \(aStudent?.name)")		// Optional(1) Optional("muzom")


// 매개변수 기본값 = 0
print("\(highSchool[]?.name)")						// Optional("yagom")

