import UIKit

var integer: Int = -100
let unsignedInteger: UInt = 50

print("Max of  Int: \(Int.max) \t Min of  Int: \(Int.min)")     // Max of  Int: 9223372036854775807      Min of  Int: -9223372036854775808
print("Max of UInt: \(UInt.max) \t Min of UInt: \(UInt.min)")   // Max of UInt: 18446744073709551615     Min of UInt: 0
print("Int64.max  : \(Int64.max) \t Int64.min  : \(Int64.min)") // Int64.max  : 9223372036854775807      Int64.min  : -9223372036854775808

//let test1: Int = Int.max + 1        // error: arithmetic operation '9223372036854775807 + 1' (on type 'Int') results in an overflow
let test2: UInt = UInt(Int.max) + 1
//print(test2)                        // 9223372036854775808

//let test3: UInt = -5                // error: negative integer '-5' overflows when stored into unsigned type 'UInt'

//let binaryInt: Int = 0b1110     // 14
//let octalInt: Int = 0o10        // 8
//let hexaInt: Int = 0xA0         // 160
//print(binaryInt, octalInt, hexaInt)

var b1: Bool = true
var b2: Bool = false
//var b3: Bool = True             // error: cannot find 'True' in scope
//var b4: Bool = False            // error: cannot find 'False' in scope

//print(0xAe3)    // 2787

for _ in 1...10 {
//    print(Int.random(in: -100...100), terminator: " ")    // -99 87 -58 25 51 -99 3 1 38 -91
//    print(Double.random(in: 0...1), terminator: " ")      // 0.14841188844740905 0.2600644917147771 0.03545890573262889 0.7673503439730355 0.2412263804944994 0.9825875830058167 0.12978498194336208 0.5950773964570936 0.3292835424011584 0.5765137715750283
}

var name: String = "Leibniz"
print("제 이름은" + " " + name + "입니다")
print(name.append("입니까?"))	// ()
print(name)				// Leibniz입니까?
print(name.count)		// 11
print(name.isEmpty)		// false

let unicodeValue: String = "\u{2665}"
print(unicodeValue)
