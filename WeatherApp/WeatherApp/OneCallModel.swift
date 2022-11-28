
import Foundation
struct OneCallModel : Codable {
	let lat : Double?
	let lon : Double?
	let timezone : String?
	let timezone_offset : Int?
	let current : Current?
	let minutely : [Minutely]?
	let hourly : [Hourly]?
	let daily : [Daily]?

	enum CodingKeys: String, CodingKey {

		case lat = "lat"
		case lon = "lon"
		case timezone = "timezone"
		case timezone_offset = "timezone_offset"
		case current = "current"
		case minutely = "minutely"
		case hourly = "hourly"
		case daily = "daily"
	}

}

struct Current : Codable {
    let dt : Int?
    let sunrise : Int?
    let sunset : Int?
    let temp : Double?
    let feels_like : Double?
    let pressure : Int?
    let humidity : Int?
    let dew_point : Double?
  //  let uvi : String?
    let clouds : Int?
    let visibility : Int?
    let wind_speed : Double?
    let wind_deg : Int?
    let weather : [Weather]?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feels_like = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dew_point = "dew_point"
      //  case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case wind_speed = "wind_speed"
        case wind_deg = "wind_deg"
        case weather = "weather"
    }
}

struct Daily : Codable {
    let dt : Int?
    let sunrise : Int?
    let sunset : Int?
    let moonrise : Int?
    let moonset : Int?
    let moon_phase : Double?
    let temp : Temp?
    let feels_like : Feels_like?
    let pressure : Int?
    let humidity : Int?
    let dew_point : Double?
    let wind_speed : Double?
    let wind_deg : Int?
    let wind_gust : Double?
    let weather : [Weather]?
    let clouds : Int?
   // let pop : Int?
  //  let uvi : Int?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moon_phase = "moon_phase"
        case temp = "temp"
        case feels_like = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dew_point = "dew_point"
        case wind_speed = "wind_speed"
        case wind_deg = "wind_deg"
        case wind_gust = "wind_gust"
        case weather = "weather"
        case clouds = "clouds"
     //   case pop = "pop"
     //   case uvi = "uvi"
    }

    

}

struct Feels_like : Codable {
    let day : Double?
    let night : Double?
    let eve : Double?
    let morn : Double?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }
}


struct Hourly : Codable {
    let dt : Int?
    let temp : Double?
    let feels_like : Double?
    let pressure : Int?
    let humidity : Int?
    let dew_point : Double?
  //  let uvi : Int?
    let clouds : Int?
    let visibility : Int?
    let wind_speed : Double?
    let wind_deg : Int?
    let wind_gust : Double?
    let weather : [Weather]?
   // let pop : Int?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case temp = "temp"
        case feels_like = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dew_point = "dew_point"
      //  case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case wind_speed = "wind_speed"
        case wind_deg = "wind_deg"
        case wind_gust = "wind_gust"
        case weather = "weather"
     //   case pop = "pop"
    }
}


struct Minutely : Codable {
    let dt : Int?
    let precipitation : Int?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case precipitation = "precipitation"
    }
}

struct Temp : Codable {
    let day : Double?
    let min : Double?
    let max : Double?
    let night : Double?
    let eve : Double?
    let morn : Double?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }
}


