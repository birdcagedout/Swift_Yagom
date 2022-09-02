enum Student {
	case elementary, middle, high
	case none
	
	init() {
		self = .none
	}
	
	init(koreanAge: Int) {
		switch koreanAge {
		case 8...13:
			self = .elementary
		case 14...16:
			self = .middle
		case 17...19:
			self = .high
		default:
			self = .none
			
		}
	}
	
	init(bornIn: Int, thisYear: Int) {
		self.init(koreanAge: thisYear - bornIn + 1)
	}
}


var teen1: Student = Student(koreanAge: 16)
//print(teen1)


var teen2: Student = Student(bornIn: 2005, thisYear: 2022)
//print(teen2)





// 실패가능한 이니셜라이저 : init?
class Person {
	let name: String
	var age: Int?
	
	init?(name1: String) {
		if name1.isEmpty {
			return nil
		}
		self.name = name1					// 빈 String이 아니라면 name 프로퍼티에 저장
	}
	
	init?(name1: String, age: Int) {
		if name1.isEmpty || age < 0 {
			return nil
		}
		
		self.name = name1
		self.age = age
	}
}


// age<0이므로 초기화 실패
let muzom: Person? = Person(name1: "muzom", age: -10)

if let person: Person = muzom {
	print(person.name)
}
else {
	print("muzom is not initialized!!")
}


// name=""이므로 초기화 실패
let gongnobi: Person? = Person(name1: "", age: 44)

if let person: Person = gongnobi {
	print(person.name)
}
else {
	print("gongnobi is not initialized!!")
}





// 열거체
enum StudentEnum: String {
	case elementary = "초등학생", middle = "중학생", high = "고등학생"
	
	init?(koreanAge: Int) {
		switch koreanAge {
			
		case 8...13:
			self = .elementary
			
		case 14...16:
			self = .middle
			
		case 17...19:
			self = .high
			
		default:
			return nil
		}
	}
	
	init?(bornIn: Int, thisYear: Int) {
		self.init(koreanAge: thisYear - bornIn + 1)
	}
}


var t1: StudentEnum? = StudentEnum(koreanAge: 20)
print(t1)

var t2: StudentEnum? = StudentEnum(bornIn: 2020, thisYear: 2022)
print(t2)

var t3: StudentEnum? = StudentEnum(rawValue: "대학생")
print(t3)

