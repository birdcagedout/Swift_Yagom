//import UIKit

// Auto Closure


// 1. 일반적인 경우의 Closure

var customerList: [String] = ["재형", "이은", "상용", "미연", "현우"]

let customerProvider: () -> String = {
	return customerList.removeFirst()
}

//print("Now Serving: \(customerProvider())")
//print("Now Serving: \(customerProvider())")
//print("Now Serving: \(customerProvider())")
//print("Now Serving: \(customerProvider())")
//print(customerList.count)


func serveCustomer(_ provider: () -> String) {
	print(customerList.count)
	print("Now Serving: \(provider())")
}

// 일반적인 경우 : 5, "재형" 4
//serveCustomer({customerList.removeFirst()})
//print(customerList.count)




// 2. 자동 클로저 : 호출시 클로저의 반환값(String)만 들어오더라도 그걸 자동으로 클로저로 변환해준다.
// 신기한 점 : customerList.removeFirst()가 먼저 호출되고 난 결과값인 String만 전달될 것 같지만 그렇지 않다.
//           즉, 인자로 들어온 customerList.removeFirst() 부분이 실제로 호출되는 시점은 provider() 이다.
func serveCustomerAuto(_ provider: @autoclosure () -> String) {
	print(customerList.count)
	print("Now Serving: \(provider())")
}

//serveCustomerAuto(customerList.removeFirst())		// 5, "재형"
//print(customerList.count)							// 4
//
//serveCustomerAuto("팀장님")							// 4, "팀장님"
//print(customerList.count)							// 4


// 3. @autoclosure로 명시된 경우에는 원래처럼 인자에 클로저를 넘길 수 없다.
//serveCustomerAuto({customerList.removeFirst()})



// 4. @autoclosure를 사용하면 탈출 클로저로 사용할 수 없기 때문에
//    만약 자동 클로저를 탈출 클로저로 사용하고 싶은 경우 ==> @autoclosure @escaping 연달아 쓴다.

func returnProvider(_ provider: @autoclosure @escaping () -> String) -> (() -> String) {
	return provider
}

let customerProviderAutoEscaping: () -> String = returnProvider(customerList.removeFirst())
print("customerProviderAutoEscaping(): \(customerProviderAutoEscaping())")

