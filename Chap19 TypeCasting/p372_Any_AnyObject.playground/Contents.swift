import Cocoa

// Any(모든 타입), AnyObject(모든 클래스 타입)을 사용하려면
// 먼저 해당 변수에 들어있는 값의 타입으로 typecast 해야한다.
class Movie {
	var name: String = ""
	var director: String = ""
	init(name: String, director: String) {
		self.name = name
		self.director = director
	}
}

var things: [Any] = []

things.append(0)														// Int
things.append(0.0)														// Double
things.append(42)														// int
things.append(3.14159)													// Double
things.append("hello")													// String
things.append((3.0, 5.0))												// (Double, Double)
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))	// Movie
things.append({ (name: String) -> String in "Hello, \(name)" })			// Closure


for (index, thing) in things.enumerated() {
	switch thing {
	case 0 as Int:
		print("[index \(index)] zero as an Int(\(thing))")
	case 0 as Double:
		print("[index \(index)] zero as a Double(\(thing))")
	case let someInt as Int:
		print("[index \(index)] an integer value of \(someInt)")
	case let someDouble as Double where someDouble > 0:
		print("[index \(index)] a positive double value of \(someDouble)")
	case is Double:																		// 이런 것도 가능
		print("[index \(index)] some other double value that I don't want to print")
	case let someString as String:
		print("[index \(index)] a string value of \"\(someString)\"")
	case let (x, y) as (Double, Double):
		print("[index \(index)] an (x, y) point at \(x), \(y)")
	case let movie as Movie:
		print("[index \(index)] a movie called \(movie.name), dir. \(movie.director)")
	case let stringConverter as (String) -> String:										// 이런 것도 가능
		print("[index \(index)] \(stringConverter("Michael"))")
	default:
		print("[index \(index)] something else")
	}
}

//[index 0] zero as an Int(0)
//[index 1] zero as a Double(0.0)
//[index 2] an integer value of 42
//[index 3] a positive double value of 3.14159
//[index 4] a string value of "hello"
//[index 5] an (x, y) point at 3.0, 5.0
//[index 6] a movie called Ghostbusters, dir. Ivan Reitman
//[index 7] Hello, Michael


0 == Double(0.0)



// Any 타입이 들어가야 할 자리에 Optional이 들어오면 Warning ==> as Any 사용하면 없어짐
let optionalNumber: Int? = 3
things.append(optionalNumber)        	// Warning
things.append(optionalNumber as Any) 	// No warning
print(optionalNumber)					// Warning
