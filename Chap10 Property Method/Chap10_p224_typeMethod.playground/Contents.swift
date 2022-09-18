import UIKit

// 타입 메서드 내부에서는 self가 타입 그 자체를 가리킨다. (인스턴스 아님)
// 따라서 타입 메서드 내부에서 "타입 프로퍼티"에 접근하거나 "타입 메서드"를 호출할 수 있다.

struct SystemVolume {
	
	// 타입 프로퍼티를 사용하면 모든 인스턴스에서 유일한 값이 된다.
	static var volume: Int = 5
	
	// 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용한다.
	static func mute() {
		self.volume = 0
	}
}


class DaumpotPlayer {
	var volume: Int = 15
	
	// 야동 볼 때
	func playYadong() {
		SystemVolume.mute()
	}
	
	// 음악 들을 때
	func playMusic() {
		SystemVolume.volume = self.volume
	}
}


SystemVolume.volume = 10

let player: DaumpotPlayer = DaumpotPlayer()

player.playYadong()
print("SystemVolume.volume: \(SystemVolume.volume)")		// 0

player.playMusic()
print("SystemVolume.volume: \(SystemVolume.volume)")		// 15

