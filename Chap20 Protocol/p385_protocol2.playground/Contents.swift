import Cocoa

// 3. mutating mothod requirements
// ==> 구조체, 열거체에서 프로토콜을 준수하기 위해 특정 메소드를 구현할 때
//     메소드 내부에서 프로퍼티 값을 변경하려면 반드시 protocol에서 mutating으로 선언하고, 구현도 mutating으로 한다.




// 4. Initializer Requirements
// ==> 프로토콜이 특정 init을 요구하는 경우, 클래스가 프로토콜을 준수하기 위해서는 required를 붙여서 구현해야 한다.
// ==> 이에 따른 파생 효과: 이제 이 클래스를 상속하는 클래스들은 모두 반드시 required init을 구현해야만 한다.
protocol Named {
	var name: String { get }
	
	init(name: String)
}

class Person: Named {
	var name: String
	
	required init(name: String) {
		self.name = name
	}
}


// <클래스 상속과 프로토콜 채택을 동시에 하는 경우>
// 클래스 상속으로 desig init을 override해야하는 상황에서
// protocol 준수까지 해야한다면 ==> required override 둘다 써주어야 한다.

// case1. 부모클래스는 protocol과 무관하고, 자식에서 상속받으며 + protocol 준수해야 하는 상황
class School {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

class MiddleSchool: School, Named {
	
	// 1) required 안 쓰면 에러: Initializer requirement 'init(name:)' can only be satisfied by a 'required' initializer
//	override init(name: String) {
//	}
	
	// 2) override 안 쓰면 에러: Overriding declaration requires an 'override' keyword
	// ==> 현재 클래스에서 required 처음 사용한다는 의미는 추후 상속할 클래스에 init 제약조건으로 작용할 뿐,
	//     이미 존재하는 School의 init을 override하겠다는 의미는 내포하지 않으므로 ==> override가 필요하다.
//	required init(name: String) {
//	}
	
	// 3) required, override 둘 다 안 쓰면 ==> 에러 2개 다 나온다.
//	init(name: String) {
//	}
	
	required override init(name: String) {
		super.init(name: name)
	}
}




// case2. 부모클래스에서 protocol을 준수하여 required 사용하고, 자식은 상속만 받는 경우
//        ==> required만 필요하고, override는 필요없다('override' is implied when overriding a required initializer)
class Student: Person {
	required init(name: String) {
		super.init(name: name)
	}
}

let muzom: Student = Student(name: "muzom")

