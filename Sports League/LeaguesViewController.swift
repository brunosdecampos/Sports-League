import UIKit

class LeaguesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weekSelected: Int?
    var leagueIndexSelected: Int?
    
    var leagueSelected: String?
    var JSONFile: String?
    
    var leagues: Array<League>!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func parseJSON(json: JSON) {
        leagues = Array<League>()
        
        let leagueDataArray = json["leagues"].arrayValue
        
        for leagueData in leagueDataArray {
            leagues.append(League(data: leagueData))
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if leagues != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sportIdentifier", for: indexPath) as! LeaguesTableViewCellController
            
            cell.feedLeagueCell(league: self.leagues[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

