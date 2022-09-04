import Cocoa
import Darwin

// 타입 자체에서 사용하는 subscript ==> static subscript

enum School: Int {
	case elementary = 1, middle, high, university
	
	static subscript(level: Int) -> School? {
		return Self(rawValue: level) 			// return School(rawValue: level)과 같은 표현
	}
}

let school: School? = School[2]
print(school)
