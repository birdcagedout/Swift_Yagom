import UIKit


// Subscript2 : subscript 메소드를 여러가지 매개변수로 정의 ==> 여러가지 용도로 사용 가능

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
	
	// subscript 1
	subscript(index: Int) -> Student? {
		get {
			if index < self.number {
				return self.students[index]
			}
			return nil
		}
		
		set {
			guard var newStudent: Student = newValue else {
				return
			}
			
			var number: Int = index
			
			if index > self.number {
				number = self.number
				self.number += 1
			}
			
			newStudent.number = number
			self.students[number] = newStudent
		}
	}
	
	
	// subscript 2
	subscript(name: String) -> Int? {
		get {
			return self.students.filter{ $0.name == name }.first?.number
		}
		
		set {
			guard var number: Int = newValue else {
				return
			}
			
			if number > self.number {
				number = self.number
				self.number += 1
			}
			
			let newStudent: Student = Student(name: name, number: number)
			self.students[number] = newStudent
		}
	}
	
	
	// subscript 3
	subscript(name: String, number: Int) -> Student? {
		return self.students.filter{ $0.name == name && $0.number == number }.first
	}
}


let highSchool: School = School()
highSchool.addStudents(names: "yagom", "muzom", "gongnobi")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")				// Optional(1) Optional("muzom")

print(highSchool["yagom"])									// Optional(0)
print(highSchool["gongnobi"])								// Optional(2)
print(highSchool["NOBI"])									// nil

highSchool[0] = Student(name: "hyejin", number: 0)
highSchool["nolja"] = 1

print(highSchool[0])										// Optional(__lldb_expr_75.Student(name: "hyejin", number: 0))
print(highSchool[4])										// nil

print(highSchool["muzom"])									// nil
print(highSchool["nolja"])									// Optional(1)
print(highSchool["gongnobi", 2])							// Optional(__lldb_expr_73.Student(name: "gongnobi", number: 2))
print(highSchool["hyejin", 3])	
// nil
