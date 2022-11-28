//
//  SecondViewController.swift
//  WeatherApp
//
//  Created by Binod Mandal on 28/11/22.
//

import UIKit

class NextDaysCell : UITableViewCell {
    
    @IBOutlet weak var imageViewIcon : UIImageView!
    @IBOutlet weak var labelDay : UILabel!
    @IBOutlet weak var labelMin : UILabel!
    @IBOutlet weak var labelMax : UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}


class SecondViewController: UIViewController {

    @IBOutlet weak var tableViewDays : UITableView!
    
    var daily : [Daily]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableViewDays.reloadData()
        }

    }

}

extension SecondViewController {
    
    func calculateCelsius(fahrenheit: Double) -> Double {
        var celsius: Double
        
        celsius = (fahrenheit - 32) * 5 / 9
        
        return celsius.rounded()
    }
    
    @IBAction func actionOnBack(_ button : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- UITableViewDelegate
extension SecondViewController : UITableViewDelegate {
    
    
}

//MARK:- UITableViewDataSource
extension SecondViewController : UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daily?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NextDaysCell", for: indexPath) as! NextDaysCell
        guard let data = daily?[indexPath.row] else{
            return cell
        }

        let url = URL.init(string: (iconBaseUrl + (data.weather?.first?.icon ?? "clouds") + ".png"))
        cell.labelDay.text = Date.init(timeIntervalSince1970: TimeInterval(data.dt ?? Int(0.0))).toString(format: "EEEE, dd MMM")
        cell.imageViewIcon.sd_setImage(with: url, completed: nil)
        cell.labelMin.text = calculateCelsius(fahrenheit: data.temp?.min ?? 0.0).description + "\u{00B0}"
        cell.labelMax.text = calculateCelsius(fahrenheit: data.temp?.max ?? 0.0).description + "\u{00B0}" + "/"

     return cell

    }
    
    
}
