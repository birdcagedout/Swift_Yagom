//import UIKit

import Foundation

// 5. 옵셔널 체이닝을 통한 메소드 호출

class Room {
	var number: Int
	
	init(number: Int) {
		self.number = number
	}
}


class Building {
	var name: String
	var room: Room?
	
	init(name: String) {
		self.name = name
	}
}


struct Address {
	var province: String
	var city: String
	var street: String
	var building: Building?
	var detailedAddress: String?
	
	init(province: String, city: String, street: String) {
		self.province = province
		self.city = city
		self.street = street
	}
	
	func fullAddress() -> String? {
		var restAddress: String? = nil		// 빌딩이름 또는 상세주소 있으면 String, 둘 다 없으면 nil
		
		if let buildingInfo: Building = self.building {
			restAddress = buildingInfo.name
		} else if let detail = self.detailedAddress {
			restAddress = detail
		}
		
		if let rest: String = restAddress {	// 빌딩이름이나 상세주소 있으면 fullAddress 만들어 리턴
			var fullAddress: String = self.province
			fullAddress += " " + self.city
			fullAddress += " " + self.street
			fullAddress += " " + rest
			
			return fullAddress
		} else {							// 없으면 nil 리턴
			return nil
		}
	}
	
	func printAddress() {
		if let address: String = self.fullAddress() {
			print(address)
		}
	}
}


class Person {
	var name: String
	var address: Address?
	
	init(name: String) {
		self.name = name
	}
}


let yagom: Person = Person(name: "야곰")
yagom.address = Address(province: "충북", city: "청주시", street: "충청대로")
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

yagom.address?.fullAddress()?.isEmpty
if let noFullAddr: Bool = yagom.address?.fullAddress()?.isEmpty {
	if noFullAddr == false {
//		yagom.address?.printAddress()
	}
}



let muzom: Person = Person(name: "무좀")
muzom.address = Address(province: "경북", city: "상주시", street: "무양로")

muzom.address?.fullAddress()?.isEmpty
if let noFullAddr: Bool = muzom.address?.fullAddress()?.isEmpty {
	if noFullAddr == false {
//		muzom.address?.printAddress()
	}
}




// 6. 옵셔널 체이닝 + subscription

let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]

var optionalDictionary: [String: [Int]]? = ["A": [0, 2, 4], "B": [1, 3, 5]]
optionalDictionary?["A"]?[0]
