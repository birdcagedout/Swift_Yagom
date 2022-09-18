import Cocoa

// Overriding(재정의)
// 부모(또는 조상)으로부터 물려받은 프로퍼티/메소드/서브스크립트 등을
// 자식 클래스에서 새롭게 정의하여 사용

// 2. 프로퍼티 overriding
// - 인스턴스 프로퍼티, 타입 프로퍼티 모두 가능
// - 저장 프로퍼티, 연산 프로퍼티 모두 가능
// - 단, 부모/조상 프로퍼티를 subclass의 새로운 "저장 프로퍼티"로 override하는 것은 불가 ==> getter, setter, observer 재정의만 가능
// - 읽기 전용(getter)을 읽기/쓰기로 만들 수는 있다. 읽기/쓰기를 읽기 전용으로 만들 수는 없다. ==> 읽기/쓰기 프로퍼티를 재정의할 때는 getter/setter 모두 재정의 해줘야 한다.


class Person {
	var name: String = ""
	var age: Int = 0
	var koreanAge: Int {
		return self.age + 1
	}
	
	var intro: String {
		return "이름: \(name), 나이: \(age)"
	}
}

class Student: Person {
	var grade: String = "F"
	
	override var intro: String {
		return super.intro + ", " + "학점: \(self.grade)"
	}
	
	override var koreanAge: Int {
		get {
			return super.koreanAge
		}
		set {
			self.age = newValue - 1
		}
	}
}


let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
//yagom.koreanAge = 56				// Cannot assign to property: 'koreanAge' is a get-only property
print(yagom.intro)					// 이름: yagom, 나이: 55
print(yagom.koreanAge)				// 56


let muzom: Student = Student()
muzom.name = "muzom"
muzom.age = 44
muzom.koreanAge = 45				// 오류 없음
print(muzom.intro)					// 이름: muzom, 나이: 44, 학점: F
print(muzom.koreanAge)				// 45
