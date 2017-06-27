import UIKit

class GamesViewController: UIViewController /*, UITableViewDataSource, UITableViewDelegate*/ {
    
    var leagueSelected: String?
//    var weekSelected: Int?
//    var fruit1: Array<String>?
//    var fruit2: Array<String>?
//    var JSONFile: String?
//    var leagues: Array<League>!
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        if leagueSelected != nil {
            print(leagueSelected!)
        }
//
//        if weekSelected != nil {
//            if weekSelected == 0 {
//                JSONFile = "sports-week-1"
//            } else if weekSelected == 1 {
//                JSONFile = "sports-week-2"
//            }
//            
//            if let file = Bundle(for: AppDelegate.self).path(forResource: JSONFile, ofType: "json") {
//                let data = NSData(contentsOfFile: file)! as Data
//                let json = JSON(data: data)
//                self.parseJSON(json: json)
//            }
//        }
    }
//
//    func parseJSON(json: JSON) {
//        leagues = Array<League>()
//        
//        let leagueDataArray = json["leagues"].arrayValue
//        
//        for leagueData in leagueDataArray {
//            leagues.append(League(data: leagueData))
//        }
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return leagues?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if leagues != nil {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "sportIdentifier", for: indexPath) as! LeaguesTableViewCellController
//            
//            cell.feedLeagueCell(league: self.leagues[indexPath.row])
//            
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
