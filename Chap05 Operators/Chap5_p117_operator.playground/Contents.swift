import UIKit

var quoInt: Int = 5 / 3					// 에러 없음
var remainder: Int = 5 % 3

var quoFloat: Float = 5 / 3				// 1이 아님

//print(quoInt, quoFloat, remainder)


// Double형에 대해서도 나머지 연산 가능
let num: Double = 5.0
var remDouble1: Double = num.truncatingRemainder(dividingBy: 1.5)	// Double형 나머지 연산
var remDouble2: Double = num.truncatingRemainder(dividingBy: 0.8)
//print(remDouble1, remDouble2)


// 음의 정수에 대해서도 나머지 연산 가능
let num2: Int = -9
var rem_plus4: Int = num2 % 4		// -9 = 4 * 정수(-2) + 나머지(-1)
var rem_minus4: Int = num2 % -4		// -9 = -4 * 정수(2) + 나머지(-1)
//print(rem_plus4, rem_minus4)



// 비트 NOT
var bitNot: Int = Int.max
//print(~bitNot)						// -9223372036854775808 = 0x8000000000000000
//print(Int.min)						// -9223372036854775808

// 비트 XOR
var bitXOR1: Int = 0
var bitXOR2: Int = 1
//print(bitXOR1^bitXOR1)					// XOR(0, 0) = 0
//print(bitXOR1^bitXOR2)					// XOR(0, 1) = 1
//print(bitXOR2^bitXOR2)					// XOR(1, 1) = 0

// 비트 Shift
var bitShift1: Int = 8					// 1000(2)
var bitShift2: Int = 2					// 0010(2)
print(bitShift1>>2)
print(bitShift2<<4)						// 0010 -> 0100 -> 1000 -> 10000 -> 100000
