import UIKit
import Foundation
import CoreGraphics
import Darwin

enum School {
	case elementary		// 초
	case middle			// 중
	case high			// 고
	case university		// 대학
	case graduate		// 대학원
}

var edu: School = .university
//print(edu)				// university


enum SchoolString: String {
	case elementary	= "초등학교"	// 초
	case middle		= "중학교"	// 중
	case high		= "고등학교"	// 고
	case university	= "대학교"	// 대학
	case graduate	= "대학원"	// 대학원
}

var eduString: SchoolString = .middle
//print(eduString)										// middle
//print(eduString.rawValue)								// 중학교
//print("최종학력은 \(eduString.rawValue) 졸업 입니다.")		// 최종학력은 중학교 졸업 입니다.


enum Numbers: Int {
	case Zero			// 묵시적 0
	case one			// 묵시적 1
	case two			// 묵시적 2
	case ten = 10		// 묵시적 10
}


// 아래 예제는 중요: Optional과 nil에 관한 예제

let edu1 = SchoolString(rawValue: "초등학교")				// type 없음에 유의
let edu2 = SchoolString(rawValue: "석박사")
//print(edu1, edu2)										// Optional(__lldb_expr_107.SchoolString.elementary) nil
//print(type(of: edu1), type(of: edu2))					// Optional<SchoolString> Optional<SchoolString>


//let num1: Numbers = Numbers(rawValue: 1)				// Value of optional type 'Numbers?' must be unwrapped to a value of type 'Numbers'
//let num2: Numbers = Numbers(rawValue: 5)				// Value of optional type 'Numbers?' must be unwrapped to a value of type 'Numbers'

let num1 = Numbers(rawValue: 1)
let num2 = Numbers(rawValue: 5)
print(num1, num2)										// Optional(__lldb_expr_107.Numbers.one) nil
print(type(of: num1), type(of: num2))					// Optional<Numbers> Optional<Numbers>
