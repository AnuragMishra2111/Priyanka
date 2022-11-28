//
//  APIManager.swift
//  WeatherApp
//
//

import Foundation
import UIKit
import Alamofire

class APIManager {
    
    
    
    static let shared : APIManager = APIManager()
    
    private init(){
        
    }
    
    func getHomeData( _ parameter : Parameters ,  complititionHandler : @escaping ((_ data : HomeData? , _ error : Error?)-> Void)){
        AF.request("https://api.openweathermap.org/data/2.5/weather", method: .get, parameters: parameter).response { responseData in
            if let data = responseData.data{
                debugPrint(responseData.data?.prettyPrintedJSONString)
                let jsonDecoder = JSONDecoder()
                let responseModel = try! jsonDecoder.decode(HomeData.self, from: data)
                complititionHandler(responseModel , nil)

            }
        }
    }
    
    func getOneCallData( _ parameter : Parameters ,  complititionHandler : @escaping ((_ data : OneCallModel? , _ error : Error?)-> Void)){
        AF.request("https://api.openweathermap.org/data/2.5/onecall", method: .get, parameters: parameter).response { responseData in
            if let data = responseData.data{
                debugPrint(responseData.data?.prettyPrintedJSONString)
                let jsonDecoder = JSONDecoder()
                let responseModel = try! jsonDecoder.decode(OneCallModel.self, from: data)
                complititionHandler(responseModel , nil)

            }
        }
    }
    
}


extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
