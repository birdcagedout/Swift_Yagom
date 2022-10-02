import Cocoa

protocol Receivable {
	func received(data: Any, from: Sendable)
}

extension Receivable {
	// 메시지 수신
	func received(data: Any, from: Sendable) {
		print("\(self) received \(data) from \(from)")
	}
}

// 발신할 수 있는 기능
protocol Sendable {
	var from: Sendable { get }
	var to: Receivable? { get }
	
	func send(data: Any)
	static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
	// 발신: 발신가능한 객체
	var from: Sendable {
		return self
	}
	
	// 발신
	func send(data: Any) {
		guard let receiver: Receivable = self.to else {
			print("Message has no receiver")
			return
		}
		
		receiver.received(data: data, from: self.from)
	}
	
	static func isSendableInstance(_ instance: Any) -> Bool {
		if let sendableInstance: Sendable = instance as? Sendable {
			return sendableInstance.to != nil
		}
		return false
	}
}


// 발신, 수신 가능한 Message
class Message: Sendable, Receivable {
	var to: Receivable?
}



// 발신, 수신 가능한 Mail
class Mail: Sendable, Receivable {
	var to: Receivable?
}


// 인스턴스 생성
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")				// Message has no receiver

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")				// __lldb_expr_1.Message received Hello from __lldb_expr_1.Message

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.to = myPhoneMessage
myMail.send(data: "Hello2")						// __lldb_expr_3.Message received Hello2 from __lldb_expr_3.Mail

Message.isSendableInstance("Hello")
Message.isSendableInstance(myPhoneMessage)
