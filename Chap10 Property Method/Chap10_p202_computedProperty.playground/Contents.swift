import UIKit


// 상황1. 연산 property를 적용하지 않고 메서드 사용
struct Point1 {
	var x: Int
	var y: Int
	
	// 원점대칭점 getter
	func oppPoint() -> Self {
		return Point1(x: -x, y: -y)
	}
	
	// 원점대칭점 setter
	mutating func oppPoint(_ oppPoint: Point1) {
		x = -oppPoint.x
		y = -oppPoint.y
	}
}

var yagom: Point1 = Point1(x: 10, y: 20)
//print(yagom)										// Point1(x: 10, y: 20)

//print(yagom.oppPoint())							// Point1(x: -10, y: -20)

yagom.oppPoint(Point1(x: 100, y: 150))				// Point1(x: -100, y: -150)
//print(yagom)




// 상황2. 연산 property 사용
struct Point2 {
	var x: Int
	var y: Int
	
	// 연산 property
	var oppPoint: Point2 {							// 연산 property의 타입을 선언함에 주목!
		
		// getter
		get {
			return Point2(x: -x, y: -y)				// Point2 타입의 인스턴스를 반환
		}
		// setter
		set(oppPoint) {								// 연산 property가 Point2 타입임을 선언했으므로, set의 인자 oppPoint도 Point2 타입일 것으로 추론
			x = -oppPoint.x
			y = -oppPoint.y
		}
	}
}

var muzom: Point2 = Point2(x: 20, y: 40)
//print(muzom)										// Point2(x: 20, y: 40)

//print(muzom.oppPoint)								// Point2(x: -20, y: -40)

muzom.oppPoint = Point2(x: 200, y: 400)
//print(muzom)										// Point2(x: -200, y: -400)





// 상황3. 연산 property에서 set 인자는 생략할 수 있고, 이때 인자 이름은 newValue로 고정
struct Point3 {
	var x: Int
	var y: Int
	
	// 연산 property
	var oppPoint: Point3 {							// 연산 property의 타입을 선언함에 주목!
		
		// getter
		get {
			return Point3(x: -x, y: -y)				// Point2 타입의 인스턴스를 반환
		}
		// setter
		set {								// 연산 property가 Point2 타입임을 선언했으므로, set의 인자 oppPoint도 Point2 타입일 것으로 추론
			x = -newValue.x
			y = -newValue.y
		}
	}
}

var gongnobi: Point3 = Point3(x: 30, y: 60)
print(gongnobi)										// Point3(x: 30, y: 60)

print(gongnobi.oppPoint)							// Point3(x: -30, y: -60)

gongnobi.oppPoint = Point3(x: 300, y: 600)
print(gongnobi)										// Point3(x: -300, y: -600)

