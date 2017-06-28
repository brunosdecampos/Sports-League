import UIKit

class GamesTableViewCellController: UITableViewCell {

    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamCity: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    
    @IBOutlet weak var visitTeamLogo: UIImageView!
    @IBOutlet weak var visitTeamName: UILabel!
    @IBOutlet weak var visitTeamCity: UILabel!
    @IBOutlet weak var visitTeamScore: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func feedGameCell(game: Game) {
        self.loadTeamImage(team: "home", imageURL: game.homeTeamLogo)
        self.homeTeamName.text = game.homeTeamName
        self.homeTeamCity.text = game.homeTeamCity
        self.homeTeamScore.text = String(game.homeTeamScore)
        
        self.loadTeamImage(team: "visit", imageURL: game.visitTeamLogo)
        self.visitTeamName.text = game.visitTeamName
        self.visitTeamCity.text = game.visitTeamCity
        self.visitTeamScore.text = String(game.visitTeamScore)
        
        self.gameStatus.text = (game.state == "Final") ? "End" : "Upcomming"
        self.gameTime.text = convertDate(time: game.time)
    }
    
    func loadTeamImage(team: String, imageURL: String) {
        if let url = URL(string: imageURL) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) -> Void in
                if data != nil {
                    DispatchQueue.main.async {
                        if team == "home" {
                            self.homeTeamLogo.image = UIImage(data: data!)
                        } else if team == "visit" {
                            self.visitTeamLogo.image = UIImage(data: data!)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func convertDate(time: Int) -> String {
        let date = Date(timeIntervalSinceReferenceDate: Double(time))
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return String(formatter.string(from: date))
    }
    
}
