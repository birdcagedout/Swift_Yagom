//import UIKit


// 1. 옵셔널 체이닝

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
}


class Person {
	var name: String
	var address: Address?
	
	init(name: String) {
		self.name = name
	}
}



let yagom: Person = Person(name: "야곰")

let yagomRoomOptionalChaining: Int? = yagom.address?.building?.room?.number			// 당연히 nil
//print(yagomRoomOptionalChaining)

//let yagomRoomOptionalUnwrapping: Int? = yagom.address!.building!.room!.number		// 런타임 에러 Fatal error: Unexpectedly found nil while unwrapping an Optional value
//print(yagomRoomOptionalUnwrapping)






// 2. 옵셔널 바인딩으로 구현한 옵셔널 체이닝

let muzom: Person = Person(name: "무좀")

var roomNumber: Int? = nil

if let yagomAddress: Address = yagom.address {
	if let yagomBuilding: Building = yagomAddress.building {
		if let yagomRoom: Room = yagomBuilding.room {
			roomNumber = yagomRoom.number
		}
	}
}

if let number: Int = roomNumber {
//	print(number)
} else {
//	print("Can't find room number")
}


// 3. 위의 예를 옵셔널 체이닝으로 다시 구현

let gongnobi: Person = Person(name: "공노비")

if let number = gongnobi.address?.building?.room?.number {
//	print(number)
} else {
//	print("Can't find room number")
}





// 4-1. 옵셔널 체이닝으로 값 할당 방법I(에러)
gongnobi.address?.building?.room?.number = 1206
//print(gongnobi.address?.building?.room?.number)		// nil ==> Person 객체 생성시 address 프로퍼티 생성되지 않음(building, room도 마찬가지)


// 4-2. 옵셔널 체이닝으로 값 할당 방법II(성공) ==> 하지만 여전히 Optional
gongnobi.address = Address(province: "서울", city: "노원", street: "노원로", building: nil, detailedAddress: nil)
gongnobi.address?.building = Building(name: "상계주공아파트")
gongnobi.address?.building?.room = Room(number: 1206)
//print(gongnobi.address?.building?.room?.number)				// Optional(1206)

gongnobi.address?.building?.room?.number = 906
//print(gongnobi.address?.building?.room?.number)				// Optional(906)


// 4-2. 옵셔널 체이닝으로 값 할당 방법III(성공) ==> 하지만 여전히 Optional
muzom.address = Address(province: "경북", city: "상주", street: "무양로", building: Building(name: "상계주공아파트"), detailedAddress: "101동")
muzom.address?.building?.room = Room(number: 102)
muzom.address?.building?.room?.number = 1000
//print(muzom.address?.building?.room?.number)				// Optional(1000) ==> 모든 정보를 다 넣더라도 Optional(옵셔널 변수의 프로퍼티이므로)



