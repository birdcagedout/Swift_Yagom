import UIKit

// 구조체와 클래스의 가장 큰 차이 : 구조체=값타입, 클래스=참조타입

// 1. 구조체
struct BasicInfo {
	let name: String
	var age: Int
}

var yagomInfo: BasicInfo = BasicInfo(name: "yagom", age: 99)
var muzomInfo: BasicInfo = yagomInfo			// 값을 복사할 뿐
yagomInfo.age = 100

//print(yagomInfo.age, muzomInfo.age)			// 100 99 ==> 구조체 인스턴스는 값을 복사하므로 ==> 복사 전 인스턴스 값이 바뀌어도 복사 후 인스턴스에 영향 없다


// 2. 클래스
class Person {
	var height: Float = 0.0
	var weight: Float = 0.0
}

var yagom: Person = Person()
var muzom: Person = yagom						// muzom인스턴스
//print(yagom.height, muzom.height)				// 0.0 0.0

yagom.height = 170.0
//print(yagom.height, muzom.height)				// 170.0 170.0 ==> muzom은 yagom을 참조하므로 yagom이 바뀌면 muzom도 바뀐다.


// 함수 내부에서 변경
func changeStruct(_ info: BasicInfo) {
	var temp: BasicInfo = info
	temp.age = 0
}

func changeClass(_ info: Person) {
	var temp: Person = info
	temp.height = 0
}

print(yagomInfo.age)							// 바뀌기 전: yagom.age=100
changeStruct(yagomInfo)
print(yagomInfo.age)							// 바뀐 후: yagom.age=100 ==> 함수 내부에서 값을 바꾸어도 반영되지 않는다.

print(muzom.height)								// 바뀌기 전: muzom.height=170.0
changeClass(muzom)
print(muzom.height)								// 바뀐 후: muzom.height=0.0 ==> 함수 내부에서 레퍼런스 값을 바꾸면 원래 인스턴스의 값도 바뀐다.
