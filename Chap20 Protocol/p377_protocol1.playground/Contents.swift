import Cocoa

// 프로토콜: 열거체, 구조체, 클래스 모두에서 사용
// 채택시: superclass 뒤에 쉼표로 구분


// 1. 프로퍼티 요구
protocol Sendable1 {
	var from: String { get }
	var to: String { get }
}

class Message1: Sendable1 {
	var sender: String
	var from: String {				// computed property로 구현해도 OK
		get {
			return self.sender
		}
		set {
			self.to = newValue		// get만 요구했는데 set도 추가로 구현해도 OK
		}
		
	}
	var to: String
	
	init(sender: String, receiver: String) {
		self.sender = sender
		self.to = receiver
	}
}

class Mail1: Sendable1 {
	var from: String
	var to: String
	
	init(sender: String, receiver: String) {
		self.from = sender
		self.to = receiver
	}
}


// 2. 메소드 요구
protocol Receivable {
	func received(data: Any, from: Sendable)		// from에는 Sendable을 준수하는 인스턴스가 와야한다
}

protocol Sendable {
	var from: Sendable { get }
	var to: Receivable? { get }
	
	func send(data: Any)
	static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receivable {
	var from: Sendable {
		return self
	}
	var to: Receivable?
	
	func send(data: Any) {
		guard let receiver: Receivable = self.to else {
			print("Message has no receiver")
			return
		}
		receiver.received(data: data, from: self.from)
	}
	
	class func isSendableInstance(_ instance: Any) -> Bool {
		if let sendableInstance: Sendable = instance as? Sendable {
			return sendableInstance.to != nil							// Sendable 맞더라도 to가 없으면 false
		}
		return false
	}
	
	func received(data: Any, from: Sendable) {
		print("Message received: data=\(data), from=\(from)")
	}
}

class Mail: Sendable, Receivable {
	var from: Sendable {
		return self
	}
	var to: Receivable?
	
	func send(data: Any) {
		guard let receiver: Receivable = self.to else {
			print("Mail has no receiver")
			return
		}
		receiver.received(data: data, from: self.from)
	}
	
	func received(data: Any, from: Sendable) {
		print("Mail received: data=\(data), from=\(from)")
	}
	
	static func isSendableInstance(_ instance: Any) -> Bool {
		if let sendableInstance: Sendable = instance as? Sendable {
			return sendableInstance.to != nil							// Sendable 맞더라도 to가 없으면 false
		}
		return false
	}
}

let myMessage: Message = Message()
let yourMessage: Message = Message()

myMessage.send(data: "Hello")			// Message has no receiver

myMessage.to = yourMessage
myMessage.send(data: "Hello")			// Message received: data=Hello, from=__lldb_expr_85.Message


let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.to = myMessage
myMail.send(data: "Hi")					// Message received: data=Hi, from=__lldb_expr_91.Mail

Message.isSendableInstance("Hello")		// F
Message.isSendableInstance(myMessage)	// T

Message.isSendableInstance(yourMessage)	// F (Sendable 맞지만 to가 없으므로)
Message.isSendableInstance(myMail)		// T
