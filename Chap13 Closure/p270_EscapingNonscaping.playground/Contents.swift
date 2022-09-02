//import UIKit

import Foundation
import os

// 탈출 클로저의 내부: self 명시 필수
// 비탈출 클로저의 내부: self 명시 불필요


typealias VoidVoidClosure = () -> Void

// 비탈출 클로저
func functionWithoutEscapingClosure(closure: VoidVoidClosure) {
	closure()
}

// 탈출 클로저
func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
	return completionHandler
}


class SomeClass {
	var x = 10
	
	// 비탈출 클로저 사용 메소드 (클로저 = 기본 클로저)
	func runNoEscapingClosure1() {
		functionWithoutEscapingClosure(closure: { () -> Void in
			x = 100
		})
	}
	
	// 비탈출 클로저 사용 메소드 (클로저 = 후행 클로저)
	func runNoEscapingClosure2() {
		functionWithoutEscapingClosure {
			x = 200
		}
	}
	
	// 탈출 클로저 사용 메소드 (클로저 = 후행 클로저)
	func runEscapingClosure() -> VoidVoidClosure {
		return functionWithEscapingClosure {
//			x = 300										// Reference to property 'x' in closure requires explicit use of 'self' to make capture semantics explicit
			self.x = 300
		}
	}
}


let instance: SomeClass = SomeClass()

instance.runNoEscapingClosure1()
print(instance.x)
instance.runNoEscapingClosure2()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)
