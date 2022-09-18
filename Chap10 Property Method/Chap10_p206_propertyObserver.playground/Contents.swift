import UIKit

// Property Observers : willSet, didSet
class Account1 {
	var credit: Int = 0 {
		willSet {
			print("현재 잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
		}
		didSet {
			print("현재 잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
		}
	}
}

let account1: Account1 = Account1()

//account1.credit = 1000
//현재 잔액이 0원에서 1000원으로 변경예정입니다.
//현재 잔액이 0원에서 1000원으로 변경되었습니다.



// 상속받은 연산 property를 재정의 ==> property observer로 구현

// base class
class Account {
	
	// 저장 property
	var credit: Int = 0 {
		willSet {
			print("현재 잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")			// 2
		}
		didSet {
			print("현재 잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")				// 3
		}
	}
	
	// 연산 property
	var dollarValue: Double {
		get {
			return Double(credit) / 1200.0
		}
		set {
			credit = Int(newValue * 1200)											// (2직전) -> 2
			print("dollarValue를 통해 credit을 \(credit)으로 변경합니다.")					// 4
		}
	}
}


// derived class
class ForeignAccount: Account {
	override var dollarValue: Double {
		willSet {
			print("현재 잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")		// 1 -> (2직전)
		}
		didSet {
			print("현재 잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")		// 5
		}
	}
}


let myAccount: ForeignAccount = ForeignAccount()
myAccount.credit = 1200

myAccount.dollarValue = 2
