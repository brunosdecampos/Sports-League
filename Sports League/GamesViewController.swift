import UIKit

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weekSelected: Int?
    
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
            
            print("Games: \(games!)")
        }
    }

    func parseJSON(json: JSON) {
        print("json: \(json)")
        games = Array<Game>()
        
        let gameDataArray = json["games"].arrayValue
        print("GameDataArray: \(gameDataArray)")
        if leagueSelected != nil {
            for gameData in gameDataArray {
                games.append(Game(league: leagueSelected!, data: gameData))
            }
        }
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("NumberOfRowsInSection: \(games?.count ?? 0)")
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(1)
        if games != nil && leagueSelected != nil {
            print(2)
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
