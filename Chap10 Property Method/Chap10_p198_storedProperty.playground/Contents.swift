import UIKit


// 상황1. 초깃값 지정 없이 생성 ==> 이니셜라이저 호출시 초깃값 지정 필요(특히 상수 property인 경우)
struct CoordinatePoint1 {
	var x: Int
	var y: Int
}

let yagom1: CoordinatePoint1 = CoordinatePoint1(x: 10, y: 5)
//print(yagomPoint.x, yagomPoint.y)


class Position1 {
	var point: CoordinatePoint1
	let name: String									// 상수로 선언된 프라퍼티는 이니셜라이저로 초기화해주어야 한다.
	
	init(name: String, newPoint: CoordinatePoint1) {
		self.name = name
		self.point = newPoint
	}
}

let muzom1: Position1 = Position1(name: "muzom", newPoint: yagom1)	// 이니셜라이즈로 초기화
//print(muzom1.name, muzom1.point.x, muzom1.point.y)				// muzom 10 5


// 상황1의 문제점: 인스턴스 생성시 일일이 값을 넣어주어야 하는 불편함 ==> 초깃값 지정으로 일부 해결
// 상황2. 초깃값 지정 ==> 이니셜라이즈 호출시 초깃값 없어도 된다 (초깃값 있어도 된다)
struct CoordinatePoint2 {
	var x: Int = 0
	var y: Int = 0
}

let yagom2a: CoordinatePoint2 = CoordinatePoint2()					// 기본값으로 초기화
var yagom2b: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 5)		// 이니셜라이저로 초기화도 가능

//print(yagom2a.x, yagom2a.y)			// 0 0
//print(yagom2b.x, yagom2b.y)			// 10 5


class Position2 {
	var point: CoordinatePoint2 = CoordinatePoint2()				// 구조체의 기본 이니셜라이저
	var name: String = "Unknown"
}

let muzom2: Position2 = Position2()
//print(muzom2.name, muzom2.point.x, muzom2.point.y)					// Unknown 0 0

muzom2.name = "김재형"
muzom2.point = yagom2b
//print(muzom2.name, muzom2.point.x, muzom2.point.y)					// 김재형 10 5


// 상황2의 문제점: 인스턴스 생성은 편하지만, 이니셜라이저로 기본 생성된 property 값들을 일일이 다시 바꿔주어야 함 ==> 이럴 거면 왜 더미값으로 초깃값을 넣어주나 비효율성
// 상황3. 인스턴스 생성시 꼭 필요한 property만 초깃값을 받고, 나머지 property는 나중에 값을 넣도록 Optional로 정의
struct CoordinatePoint3 {
	var x: Int
	var y: Int
}


class Position3 {
	var point: CoordinatePoint3?									// Optional로 정의 ==> 인스턴스 생성시 기본값 필수사항 아님
	var name: String
	
	init(name: String) {
		self.name = name
	}
}


let muzom3: Position3 = Position3(name: "muzom")					// 이름은 필수사항, point 좌표값은 필수아님

muzom3.point = CoordinatePoint3(x: 20, y:10)						// 나중에 좌표를 알게되면 그때 입력하면 됨
//print(muzom3.point!.x, muzom3.point!.y)							// 대신 좌표값에 접근하려면 unwrap 필요 20 10


// 상황3의 문제점: 필요할 때 property의 값을 입력한다는 장점이 있지만, Optional이기 때문에 사용하기 불편
// 상황4. 필요할 때 호출로 property 값을 초기화하는 지연 property
struct CoordinatePoint {
	var x: Int = 0
	var y: Int = 0
}

class Position {
	lazy var point: CoordinatePoint = CoordinatePoint()				// 정의는 lazy 외에는 동일
	let name: String
	
	init(name: String) {
		self.name = name
	}
}


let muzom: Position = Position(name: "muzom")						// 일단 instance는 만들어짐, point 변수는 아직 안 만들어짐
print(muzom.point.x, muzom.point.y)									// 처음으로 point에 접근할 때 ==> CoordinatePoint() 호출되어 property 만들어짐


// 지연 property의 문제점: 다중 스레드 환경에서 비슷한 시점에 여러 쓰레드가 하나의 지연 property에 접근한다면 여러번 초기화될 가능성도 있다.
