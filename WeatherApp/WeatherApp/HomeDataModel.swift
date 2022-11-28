
import Foundation
struct HomeData : Codable {
	let coord : Coord?
	let weather : [Weather]?
	let base : String?
	let main : Main?
	let visibility : Int?
	let wind : Wind?
	let clouds : Clouds?
	let dt : Int?
	let sys : Sys?
	let timezone : Int?
	let id : Int?
	let name : String?
	let cod : Int?

	enum CodingKeys: String, CodingKey {

		case coord = "coord"
		case weather = "weather"
		case base = "base"
		case main = "main"
		case visibility = "visibility"
		case wind = "wind"
		case clouds = "clouds"
		case dt = "dt"
		case sys = "sys"
		case timezone = "timezone"
		case id = "id"
		case name = "name"
		case cod = "cod"
	}


}


struct Clouds : Codable {
    let all : Int?
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}



struct Coord : Codable {
    let lon : Int?
    let lat : Int?
    enum CodingKeys: String, CodingKey {
        case lon = "lon"
        case lat = "lat"
    }
}


struct Main : Codable {
    let temp : Double?
    let feels_like : Double?
    let temp_min : Double?
    let temp_max : Double?
    let pressure : Int?
    let humidity : Int?

    enum CodingKeys: String, CodingKey {

        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}


struct Sys : Codable {
    let type : Int?
    let id : Int?
    let country : String?
    let sunrise : Int?
    let sunset : Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}


struct Weather : Codable {
    let id : Int?
    let main : String?
    let description : String?
    let icon : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}


struct Wind : Codable {
    let speed : Double?
    let deg : Int?
    let gust : Double?

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }
}
