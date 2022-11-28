//
//  ViewController.swift
//  WeatherApp
//
//

import UIKit
import SDWebImage
import Alamofire

class DaysCollectionViewCell : UICollectionViewCell{
    
    //MARK:- @IBOutlet
    @IBOutlet weak var labelTime : UILabel!
    @IBOutlet weak var labelTemprature : UILabel!
    @IBOutlet weak var imageViewIcon : UIImageView!
    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}


class ViewController: UIViewController {

    
    
    
    //MARK:- @IBOutlets
    @IBOutlet weak var collectionViewDays : UICollectionView!
    @IBOutlet weak var labelWeatherDiscription : UILabel!
    @IBOutlet weak var labelDateTime : UILabel!
    @IBOutlet weak var labelTempreture : UILabel!
    @IBOutlet weak var labelWind : UILabel!
    @IBOutlet weak var labelFeelLikes : UILabel!
    @IBOutlet weak var labelSunrise : UILabel!
    @IBOutlet weak var labelPressure : UILabel!
    @IBOutlet weak var imageViewMainWeather : UIImageView!

    var homeData : HomeData?
    var oneCallData : OneCallModel?

    var iconBaseUrl = "http://openweathermap.org/img/wn/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        // Do any additional setup after loading the view.
        
    }
}

//MARK:- Helper Methods
extension ViewController {
    
    func setupCollectionView(){
        collectionViewDays.delegate = self
        collectionViewDays.dataSource = self
        let param = ["lat" : "35" , "lon" : "39", "appid":"4cd569ffb3ecc3bffe9c0587ff02109f"]
        APIManager.shared.getHomeData(param) { data, error in
            self.homeData = data
            self.setData()
        }
        
        APIManager.shared.getOneCallData(param) { data, error in
            self.oneCallData = data
            self.collectionViewDays.reloadData()
        }
    }
    
    
    func setData(){
        
        guard let data = homeData else{
            return
        }
        let url = URL.init(string: (iconBaseUrl + (data.weather?.first?.icon ?? "clouds") + ".png"))
        labelWeatherDiscription.text = homeData?.weather?.first?.description
        imageViewMainWeather.sd_setImage(with:url , completed: nil)
        labelTempreture.text = calculateCelsius(fahrenheit: homeData?.main?.temp ?? 0.0).description
        labelWind.text = (data.wind?.speed?.description ?? "0.0") + " km/i"
        labelPressure.text = data.main?.pressure?.description
        labelFeelLikes.text = calculateCelsius(fahrenheit: homeData?.main?.feels_like ?? 0.0).description + "\u{00B0}"
        labelDateTime.text = Date.init(timeIntervalSince1970: TimeInterval(data.sys?.sunrise ?? Int(0.0))).toString(format: "EEEE, DD MMM")
        labelSunrise.text = Date.init(timeIntervalSince1970: TimeInterval(data.sys?.sunrise ?? Int(0.0))).toString(format: "HH:MM")


    }
    
    func calculateCelsius(fahrenheit: Double) -> Double {
        var celsius: Double
        
        celsius = (fahrenheit - 32) * 5 / 9
        
        return celsius.rounded()
    }

}

//MARK:- UICollectionViewDelegate
extension ViewController : UICollectionViewDelegate  , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 60, height: 100)
    }
    
}

//MARK:- UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oneCallData?.hourly?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCollectionViewCell", for: indexPath) as! DaysCollectionViewCell
        guard let data = oneCallData?.hourly?[indexPath.row] else{
            return cell
        }
        let url = URL.init(string: (iconBaseUrl + (data.weather?.first?.icon ?? "clouds") + ".png"))
        cell.labelTime.text = Date.init(timeIntervalSince1970: TimeInterval(data.dt ?? Int(0.0))).toString(format: "HH:MM")
        cell.imageViewIcon.sd_setImage(with: url, completed: nil)
        cell.labelTemprature.text = calculateCelsius(fahrenheit: data.temp ?? 0.0).description + "\u{00B0}"
     return cell
    }
}


extension Date {

    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
