import UIKit



// 1. flatMap

func doubleIfEven(_ num: Int) -> Int? {
	if num.isMultiple(of: 2) {
		return num * 2
	}
	return nil
}

//print(Optional(2).flatMap(doubleIfEven))		// Optional(4)
//print(Optional(3).flatMap(doubleIfEven))		// nil




// 2. flatMap vs. map

let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

//print(mapped)				// [Optional(1), Optional(2), nil, Optional(5)]
//print(compactMapped)		// [1, 2, 5]



// 2-1. flatMap vs. map

let multiContainer = [
	[1, 2, Optional.none],
	[3, Optional.none],
	[4, 5, Optional.none]
]

let mappedMulti1 = multiContainer.map{ $0 }
let flatMappedMulti1 = multiContainer.flatMap{ $0 }
let compactMappedMulti1 = multiContainer.compactMap{ $0 }

let mappedMulti2 = multiContainer.map{ $0.map{ $0 } }
let flatMappedMulti2 = multiContainer.flatMap{ $0.flatMap{ $0 } }
let compactMappedMulti2 = multiContainer.compactMap{ $0.compactMap{ $0 } }

//print(mappedMulti1)					// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
//print(flatMappedMulti1)				// [Optional(1), Optional(2), nil, Optional(3), nil, Optional(4), Optional(5), nil]
//print(compactMappedMulti1)			// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
//
//print(mappedMulti2)					// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
//print(flatMappedMulti2)				// [1, 2, 3, 4, 5]
//print(compactMappedMulti2)			// [[1, 2], [3], [4, 5]]



// 2-2. flatMap vs. map

func string2Int(_ string: String) -> Int? { return Int(string) }
func int2String(_ int: Int) -> String? { return "\(int)" }

var optionalString: String? = "2"

let flatResult = optionalString.flatMap(string2Int).flatMap(int2String).flatMap(string2Int)
let mapResult = optionalString.map(string2Int)

//print(optionalString)	// Optional("2")
//print(flatResult)		// Optional(2)
//print(mapResult)		// Optional(Optional(2))



// 3. Optional Binding으로 flatMap 구현

var result: Int?

if let string: String = optionalString {
	if let number: Int = string2Int(string) {
		if let finalString: String = int2String(number) {
			if let finalNumber: Int = string2Int(finalString) {
				result = Optional(finalNumber)
			}
		}
	}
}
//print(result)


if let string: String = optionalString,
   let number: Int = string2Int(string),
   let finalString: String = int2String(number),
   let finalNumber: Int = string2Int(finalString) {
	result = Optional(finalNumber)
}
//print(result)



// 4. flatMap 체이닝 중간에 연산실패/값없음 ==> 별도의 예외처리 없이 빈 컨테이너 반환

func int2Nil(param: Int) -> String? {
	return nil
}

optionalString = "2"

result = optionalString.flatMap(string2Int).flatMap(int2String).flatMap(string2Int)
print(result)

result = optionalString.flatMap(string2Int).flatMap(int2Nil).flatMap(string2Int)
print(result)
