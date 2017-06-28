import UIKit

class LeaguesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weekSelected: Int?
    var leagueIndexSelected: Int?
    
    var leagueSelected: String?
    var JSONFile: String?
    
    var leagues: Array<League>!
    
//    var fruit1: Array<String>?
//    var fruit2: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fruit1 = ["Apple", "Banana"]
//        fruit2 = ["Orange"]
        
        if weekSelected != nil {
            if weekSelected == 0 {
                JSONFile = "sports-week-1"
            } else if weekSelected == 1 {
                JSONFile = "sports-week-2"
            }
            
            if let file = Bundle(for: AppDelegate.self).path(forResource: JSONFile, ofType: "json") {
                let data = NSData(contentsOfFile: file)! as Data
                let json = JSON(data: data)
                self.parseJSON(json: json)
            }
        }
    }
    
    func parseJSON(json: JSON) {
        leagues = Array<League>()
        
        let leagueDataArray = json["leagues"].arrayValue
//        print("LeagueDataArray; \(leagueDataArray)")
        for leagueData in leagueDataArray {
            leagues.append(League(data: leagueData))
            //print(leagueData)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let currCell = tableView.cellForRow(at: indexPath) as! LeaguesTableViewCellController
        self.leagueSelected = currCell.teamName!.text
        self.leagueIndexSelected = indexPath.row
        
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverViewController = segue.destination as! GamesViewController
        receiverViewController.weekSelected = self.weekSelected
        receiverViewController.leagueSelected = self.leagueSelected
        receiverViewController.leagueIndexSelected = self.leagueIndexSelected
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(leagues?.count ?? 0)
        return leagues?.count ?? 0
        
//        if section == 0 {
//            return fruit1?.count ?? 0
//        } else {
//            return fruit2?.count ?? 0
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if leagues != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sportIdentifier", for: indexPath) as! LeaguesTableViewCellController
            
            cell.feedLeagueCell(league: self.leagues[indexPath.row])
            //cell.setForecast(forecast: self.forecasts[indexPath.row])
            
            // cell.fruit.image = UIImage(named: (fruit1![indexPath.row]) + ".png")
            //cell.teamName.text = leagues![indexPath.row]
            
            
            return cell
        } else {
            return UITableViewCell()
        }
        
//        if fruit1 != nil && fruit2 != nil {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "sportIdentifier", for: indexPath) as! LeaguesTableViewCellController
//            
//            if indexPath.section == 0 {
//                cell.fruit.image = UIImage(named: (fruit1![indexPath.row]) + ".png")
//                cell.name.text = fruit1![indexPath.row]
//            } else {
//                cell.fruit.image = UIImage(named: (fruit2![indexPath.row]) + ".png")
//                cell.name.text = fruit2![indexPath.row]
//            }
//            
//            return cell
//        } else {
//            return UITableViewCell()
//        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            print(fruit1![indexPath.row])
//        } else {
//            print(fruit2![indexPath.row])
//        }
//        
//        print(indexPath.section)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

