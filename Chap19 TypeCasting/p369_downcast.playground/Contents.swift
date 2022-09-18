import Cocoa

// downcast: as?(실패시 nil), as!(실패시 런타임에러)

class MediaItem {
	var name: String
	init(name: String) {
		self.name = name
	}
}

class Movie: MediaItem {
	var director: String
	init(name: String, director: String) {
		self.director = director
		super.init(name: name)
	}
}

class Song: MediaItem {
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}


let library = [
	Movie(name: "Casablanca", director: "Michael Curtiz"),
	Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
	Movie(name: "Citizen Kane", director: "Orson Welles"),
	Song(name: "The One And Only", artist: "Chesney Hawkes"),
	Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]	// the type of "library" is inferred to be [MediaItem]


for item in library {
	if let movie = item as? Movie {
		print("Movie: \(movie.name), director = \(movie.director)")
	} else if let song = item as? Song {
		print("Song: \(song.name), artist = \(song.artist)")
	}
}

//Movie: Casablanca, director = Michael Curtiz
//Song: Blue Suede Shoes, artist = Elvis Presley
//Movie: Citizen Kane, director = Orson Welles
//Song: The One And Only, artist = Chesney Hawkes
//Song: Never Gonna Give You Up, artist = Rick Astley
