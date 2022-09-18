import UIKit


// deinit() : 클래스의 인스턴스에만 가능

class SomeClass {
	deinit {
		print("Deinit이 호출되었습니다.")
	}
}

var v1: SomeClass? = SomeClass()
v1 = nil										// Deinit이 호출되었습니다.



