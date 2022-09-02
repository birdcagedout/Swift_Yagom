import UIKit

// Filter
// new컨테이너 = 컬렉션.filter(Bool 반환 클로저)


let numbers: ClosedRange = (0...10)

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
	return number % 2 == 0
}

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }

//print(evenNumbers)			// [0, 2, 4, 6, 8, 10]
//print(oddNumbers)				// [1, 3, 5, 7, 9]




// 필터 + 맵
let filteredNumbers: [Int] = numbers.filter { $0 % 2 == 0 }		// 짝수만 골라서
let mappedFiltered: [Int] = filteredNumbers.map { $0 * $0 }		// 제곱
//print(mappedFiltered)		// [0, 4, 16, 36, 64, 100]

let MFnumbers: [Int] = numbers.filter { $0 % 2 == 0 }.map { $0 * $0 }
//print(MFnumbers)			// [0, 4, 16, 36, 64, 100]




// 맵 + 필터
let mappedNums: [Int] = numbers.map { $0 * $0 }
let filteredMappedNums: [Int] = mappedNums.filter { $0 < 50 }
print(filteredMappedNums)	// [0, 1, 4, 9, 16, 25, 36, 49]

let FMnumbers: [Int] = numbers.map{ $0 * $0 }.filter{ $0 >= 50 }
print(FMnumbers)			// [64, 81, 100]


