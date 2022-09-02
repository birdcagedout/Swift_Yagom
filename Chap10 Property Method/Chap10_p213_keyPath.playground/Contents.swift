import UIKit


// KeyPath: \타입이름.경로.경로
// 특정 type의 특정 property를 가리킬 수 있는 포인터 역할

class Person1 {
	var name: String
	init(name: String) {
		self.name = name
	}
}

struct Device1 {
	var name: String
	var owner: Person1
}

//print(type(of: \Person1.name))				// ReferenceWritableKeyPath<Person1, String>
//print(type(of: \Device1.name))				// WritableKeyPath<Device1, String>




// keyPath의 사용한 subscript
class Person {
	let name: String
	init(name: String) {
		self.name = name
	}
}

struct Device {
	var name: String
	var owner: Person
}


let yagom: Person = Person(name: "yagom")
let muzom: Person = Person(name: "muzom")

let macBook = Device(name: "MacBook Pro", owner: yagom)		// macBook = yagom꺼
var iPad = Device(name: "iPad 5th Gen", owner: muzom)		// iPad = muzom꺼
let iPhone = Device(name: "iPhone", owner: muzom)			// iPhone = muzom꺼


let deviceName_KeyPath = \Device.name
let deviceOwner_KeyPath = \Device.owner
let deviceOwnerName_KeyPath = deviceOwner_KeyPath.appending(path: \.name)


// Device 타입의 name 프로퍼티를 subscript방식으로 접근
//print(macBook[keyPath: deviceName_KeyPath])		// MacBook Pro
//print(iPad[keyPath: deviceName_KeyPath])			// iPad 5th Gen
//print(iPhone[keyPath: deviceName_KeyPath])		// iPhone


// Device 타입의 owner 프로퍼티(=Person 인스턴스)의 name 프로퍼티에 접근
//print(macBook[keyPath: deviceOwnerName_KeyPath])	// yagom
//print(iPad[keyPath: deviceOwnerName_KeyPath])		// muzom
//print(iPhone[keyPath: deviceOwnerName_KeyPath])		// muzom


// keypath를 이용해 property의 값을 바꿔본다
// 주의 : 해당 keypath는 모두 var여야한다.(let이 하나라도 있으면 에러)
iPad[keyPath: deviceName_KeyPath] = "iPad Pro"
//print(iPad[keyPath: deviceName_KeyPath])			// iPad Pro

//iPad[keyPath: deviceOwnerName_KeyPath] = "gongnobi"	// error: cannot assign through subscript: 'deviceOwnerName_KeyPath' is a read-only key path




// (Type) -> Value 타입의 클로저 = keyPath
struct User {
	let name: String
	let nickname: String?
	let age: Int
	
	var isAdult: Bool {
		return age >= 19
	}
}


let ya: User = User(name: "yagomUser", nickname: "bear", age: 100)
let mu: User = User(name: "muzomUser", nickname: "김재형", age: 44)
let gong: User = User(name: "gongnobiUser", nickname: nil, age: 22)


let family: [User] = [ya, mu, gong]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickname)
let adults: [String] = family.filter(\.isAdult).map(\.name)

print(names)
print(nicknames)
print(adults)

