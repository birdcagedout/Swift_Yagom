//import UIKit


// guard 불표현 else { }
for i in 0...10 {
	guard i % 2 == 0 else {
//		print("홀수입니다: \(i)")
		continue
	}
}


func hello(_ person: [String: String]) {
	
	guard let name: String = person["name"] else {
		return
	}
	print("Hello~ \(name)")							// Hello~ Jenny
	print("Hello~ \(person["name"])")				// Hello~ Optional("Jenny")
	
	
	guard let location: String = person["location"] else {
		print("location is unknown")
		return
	}
	print("Enjoy \(location)")
}

var person1: [String: String] = [String: String]()
var person2: [String: String] = ["name": "Sonny"]
person1["name"] = "Jenny"

hello(person1)
hello(person2)
