import UIKit

class LeaguesTableViewCellController: UITableViewCell {
    
    @IBOutlet weak var SportImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func feedLeagueCell(league: League) {
        self.teamName.text = league.name
        self.loadSportImage(imageURL: league.image)
    }
    
    func loadSportImage(imageURL: String) {
        if let url = URL(string: imageURL) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { (data, response, error) -> Void in
                if data != nil {
                    DispatchQueue.main.async {
                        self.SportImage.image = UIImage(data: data!)
                    }
                }
            }
            
            task.resume()
        }
    }
}
