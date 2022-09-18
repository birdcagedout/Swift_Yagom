import UIKit

var names: Array<String> = ["yagom", "chulsoo", "muzom", "younghee", "yagom"]
//print(names)
names.append(contentsOf: ["AK47", "K2"])

var names2: [String] = ["yagom", "chulsoo", "muzom", "younghee", "yagom"]
//print(names2)
//print(names.count)


var emptyArray: [Any] = [Any]()
//print(emptyArray)

var emptyArray2: [Any] = Array<Any>()
//print(emptyArray2)


//print(emptyArray.isEmpty)
//print(emptyArray2.isEmpty)


var emptyInt: [Int] = [Int]()
emptyInt.append(1)
emptyInt.append(100)
emptyInt.append(100_000_000)		// 정수포맷을 이렇게 쓸 수도 있다.

//print(emptyInt.contains(100))
//print(emptyInt.contains(99))
//print(emptyInt.contains(100000000))


// p.96 딕셔너리
var dict: Dictionary<String, Any> = [String: Any]()
dict["someKey"] = "value"
dict["anotherKey"] = 100
//print(dict)
//print(dict["someKey"])			// 리턴값이 왜 Optional인지 생각해보라. (키에 해당하는 값이 없으면 nil 반환)


dict["someKey"] = "newValue"
dict["anotherKey"] = nil			// 제거하는 것과 같은 효과
//print(dict)

dict.removeValue(forKey: "someKey")
//print(dict)


// p.98 집합/세트
var nameSet: Set<String> = Set<String>()
nameSet.insert("yagom")
nameSet.insert("muzom")
nameSet.insert("muzom")
print(nameSet)
//print(type(of: nameSet))


