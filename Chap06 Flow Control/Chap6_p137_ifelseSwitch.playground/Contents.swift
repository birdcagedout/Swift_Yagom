import UIKit


// if - else
var a: Int = 3
var b = 0

if a == 3 {
//	print(a)
}

//if b == 0 print(b)	// 중괄호 생략 불가 Expected '{' after 'if' condition



// switch
var switchInt: Int = 100
var switchArray: [Int] = [1,2,3]
var switchSet: Set<Int> = [1,2,3]
var switchDict: Dictionary<Int, Int> = [1:1, 2:2, 3:3]

switch switchInt {
case 0:
	print(0)
	
case 1...10:
	print("small number")
//	fallthrough
	
case 11...100:
	print("middle number")
	
case Int.min..<0, 100..<Int.max:				// case range: 2개를 or로 묶은 형태 (range에 || 쓸 수 없다)
	print("minius or big number")
	
default:
	print("not 0...10")
}

