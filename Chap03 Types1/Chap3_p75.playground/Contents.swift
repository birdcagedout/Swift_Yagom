//import UIKit


let a:Int=1
//print(a)

//var str: String
//print(str)		// Variable 'str' used before being initialized


var varInt: Int = 100
//var someUInt: UInt = varInt		// Cannot convert value of type 'Int' to specified type 'UInt'


var varFloat: Float = 3.14
//var varDouble: Double = varFloat	// Cannot convert value of type 'Float' to specified type 'Double'


var varCharacter: Character = "🚗"
//print(varCharacter)


var varString: String = "하하하🇰🇷"
//varString = varCharacter			// Cannot assign value of type 'Character' to type 'String'
//print(varString)


var varAny: Any = "yagom"
varAny = varCharacter
varAny = 1
varAny = 3.14

//var varDouble: Double = varAny	// Cannot convert value of type 'Any' to specified type 'Double'
//var varDouble: Double = Double(varAny)	// No exact matches in call to initializer


//varAny = nil						// 'nil' cannot be assigned to type 'Any'
print(varAny)

