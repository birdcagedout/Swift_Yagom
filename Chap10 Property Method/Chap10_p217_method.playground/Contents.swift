import UIKit

// 1. 구조체, 열거형에도 메서드 사용 가능
// 2. 구조체, 열거형에 정의된 메서드 내부에서 프로퍼티를 변경하는 경우 ==> mutating을 붙여야 한다.
struct LevelStruct {
	var level: Int = 0 {
		didSet {
			print("Level: \(level)")
		}
	}
	
	mutating func levelUp() {
		print("Level Up!")
		level += 1
	}
	
	mutating func levelDown() {
		print("Level Down!")
		level -= 1
		if level < 0 {
			reset()
		}
	}
	
	mutating func jumpLevel(_ to: Int) {
		print("Jump to \(to)")
		level = to
	}
	
	mutating func reset() {
		print("Reset!")
		self.level = 0
	}
}

var l1: LevelStruct = LevelStruct()

//l1.levelUp()
//l1.levelDown()
//l1.levelDown()
//l1.jumpLevel(2)




class LevelClass {
	var level: Int = 0
	
	func reset() {
//		self = LevelClass()			// Cannot assign to value: 'self' is immutable
	}
}


struct LevelStruct2 {
	var level: Int = 0 {
		didSet {
			print("level: \(level)")
		}
	}
	
	init() {
	}
	
	init(_ val: Int) {
		level = val
	}
	
	mutating func levelUp() {
		print("Level Up!!")
		level += 1
	}
	
	mutating func reset() {
		print("Reset!!")
		self = LevelStruct2()		// 구조체, 열거형은 self 프로퍼티를 사용하여 자신 자체를 치환 가능
		print("level: \(level)")
	}
}


var ls2: LevelStruct2 = LevelStruct2(100)
//ls2.levelUp()								// level: 101
//ls2.reset()								// level: 0
//ls2.levelUp()								// level: 1


enum Switch {
	case on, off
	
	mutating func tick() {
		self = self == .on ? .off : .on
		print("current state: \(self)")
	}
}

var sw: Switch = Switch.off
//sw.tick()									// current state: on
//sw.tick()									// current state: off
//sw.tick()									// current state: on





// 인스턴스 이름을 함수처럼 호출하기 : callAsFunction() 메소드를 구현해주면 됨

struct Puppy {
	var name: String = "멍멍이"
	
	func callAsFunction() {
		print("멍멍")
	}
}

var dog: Puppy = Puppy()
dog()										// 멍멍

