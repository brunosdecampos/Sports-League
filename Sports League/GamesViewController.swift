import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weekSelected: Int?
    var leagueIndexSelected: Int?
    
    var leagueSelected: String?
    var JSONFile: String?
    
    var games: Array<Game>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if leagueSelected != nil {
//            var jsonArr:[JSON] = JSON["leagues"].arrayValue
//            var stringArr:[String] = JSON["leagues"].arrayValue.map { $0.stringValue }
            
            games = Array<Game>()
            
            for item in json["leagues"].arrayValue {
                if item["name"].stringValue == leagueSelected! {
                    for innerItem in item["games"].arrayValue {
                        //print("\(innerItem["home_team_name"]) x \(innerItem["visit_team_name"])")
                        
                        games.append(Game(leagueIndex: leagueIndexSelected!, data: innerItem))
                    }
                }
            }
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("NumberOfRowsInSection: \(games?.count ?? 0)")
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if games != nil && leagueSelected != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "gameIdentifier", for: indexPath) as! GamesTableViewCellController
            
            cell.feedGameCell(game: self.games[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
