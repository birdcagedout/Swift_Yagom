import UIKit


// 클래스, 구조체, 열거형 모두 이니셜라이저 구현 가능

class SomeClass {
	init() {
		
	}
}


struct SomeStruct {
	init() {
		
	}
}


enum SomeEnum {
	case A, B, C, D, F						// 열거형에서는 가능한 case를 먼저 정의
	
	init() {
		self = .F							// 이니셜라이저에서 반드시 case 하나를 정의하여야 한다.
	}
}

var class1: SomeClass = SomeClass()
var struct1: SomeStruct = SomeStruct()
var enum1: SomeEnum = SomeEnum()
//print(enum1)								// F







