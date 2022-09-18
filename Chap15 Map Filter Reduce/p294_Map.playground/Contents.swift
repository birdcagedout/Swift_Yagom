import UIKit


// Map : new컬렉션 = 컬렉션.map(클로저)


let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var stringNumbers: [String] = [String]()



// 1. for in 구문
for number in numbers {
	doubledNumbers.append(number*2)
	stringNumbers.append("\(number)")
}
//print(doubledNumbers)			// [0, 2, 4, 6, 8]
//print(stringNumbers)			// ["0", "1", "2", "3", "4"]




// 2. map 사용 (for in과 비교할 것) : 배열은 순서 있다
//var doubledNums: [Int]
//var stringNums: [String]


var doubledNums = numbers.map( {(num: Int) -> Int in
	return num * 2
})

var stringNums = numbers.map( {(num: Int) -> String in
	return "\(num)"
})

//print(doubledNums)			// [0, 2, 4, 6, 8]
//print(stringNums)				// ["0", "1", "2", "3", "4"]


// 2-1. 클로저 간결화
let tripledNumbers: [Int] = numbers.map {$0 * 3}
let tripledStrings: [String] = numbers.map {"\($0 * 3)"}
//print(tripledNumbers)			// [0, 3, 6, 9, 12]
//print(tripledStrings)			// ["0", "3", "6", "9", "12"]




// 3. Dictionary에 map 적용

let dict: [String: String] = ["a": "A", "b": "B"]

//dict.map { print($0) }		// 실행 결과가 왜 dict가 아니라 tuple이 나왔기 이상해야 정상 (이유는 아래에 설명)
//(key: "a", value: "A")
//(key: "b", value: "B")


// ** 매우 중요 **
// Iterating over a dictionary yields the key-value pairs as two-element tuples.
// https://stackoverflow.com/questions/41687593/why-does-dictionary-map-return-an-array-of-tuples-and-where-is-it-documented

var keys: [String] = dict.map { (tuple: (String, String)) -> String in		// dict의 요소가 map으로 들어올 때 (key, value) tuple로 들어온다
//	print(tuple)							// ("a", "A")	("b", "B")
	return tuple.0							// .0 : 둘 중 첫번째 String(key)
}

var values: [String] = dict.map {$0.1}		// .1 : 요소 중 두번째(value)

//print(keys)			// ["b", "a"]
//print(values)			// ["B", "A"]


// 컬렉션 타입 중 Dictionary, Set은 순서가 없다 : https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html


// 3-1. Dictionary 예제 1개 더
let movies = ["짱구는못말려","다만악에서구하소서","강철비2","오케이마담","나의소녀시대"]
let rates = [9.4, 8.6, 8.0, 8.1, 9.3]
var dictionary = [String: Double]()

for i in 0..<movies.count {
	dictionary[movies[i]] = rates[i]
}
//print(dictionary)		// ["다만악에서구하소서": 8.6, "오케이마담": 8.1, "나의소녀시대": 9.3, "짱구는못말려": 9.4, "강철비2": 8.0]

let sortedDitionary = dictionary.sorted { $0.1 > $1.1 }		// value 높은 순서대로 key:value 쌍을 정렬
 
for i in 0..<sortedDitionary.count {
	print("\(i+1).\(sortedDitionary[i].key) \t\t \(sortedDitionary[i].value)")
}
//1.짱구는못말려 		 9.4
//2.나의소녀시대 		 9.3
//3.다만악에서구하소서 		 8.6
//4.오케이마담 		 8.1
//5.강철비2 		 8.0




// 4. Set에 map 적용 : Set은 순서가 없다
var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)		// [4, 10, 2, 6, 8]




// 5. Range에 map 적용 : Range는 순서 있다
let numberRange: CountableClosedRange = (0...5)
let resultRange: [Int] = numberRange.map{ $0 * 2 }
//print(resultRange)	// [0, 2, 4, 6, 8, 10]



// 6. Optional에 map 적용
let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0 * 2 }
print(resultInt)		// Optional(6)

