import UIKit

var array: [Int] = [0, 1, 2, 3, 4]
var set: Set<Int> = [0, 1, 2, 3, 4]			// 주의: 원래 순서가 없다
var dict: Dictionary<String, Int> = ["a": 1, "b": 2, "c": 3]
var str: String = "ABCDEF"

//print(array.randomElement()!)		// 5개 중 랜덤으로 1개 뽑기

//print(array.shuffled())				// 셔플 섞은 배열을 리턴 (원래 배열은 안 바뀜)
//print(array)


//array.shuffle()						// 원래 배열 자체를 셔플 섞기
//print(array)

//print(set)							// [1, 3, 2, 0, 4] ==> 이게 원래 순서 (순서 없음)
//print(set.shuffled())					// 섞어서 배열로 리턴 (원래 set은 안 바뀜)
//print(set)							// [1, 3, 2, 0, 4] ==> 이게 원래 순서 (순서 없음)
//set.shuffle()							// Value of type 'Set<Int>' has no member 'shuffle'


//print(dict.shuffled())				// (키,값) 튜플이 원소인 배열로 리턴
//print(dict)

print(str.shuffled())
print(str)
