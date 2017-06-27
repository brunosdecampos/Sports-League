import Foundation

class Game {
    
    var homeTeamLogo: String
    var homeTeamName: String
    var homeTeamCity: String
    var homeTeamScore: Int
    
    var visitTeamLogo: String
    var visitTeamName: String
    var visitTeamCity: String
    var visitTeamScore: Int
    
    var state: String
    var time: Int
    
    init(data: JSON) {
        self.homeTeamLogo = data["home_team_logo"].stringValue
        self.homeTeamName = data["home_team_name"].stringValue
        self.homeTeamCity = data["home_team_city"].stringValue
        self.homeTeamScore = data["home_team_score"].intValue
        
        self.visitTeamLogo = data["visit_team_logo"].stringValue
        self.visitTeamName = data["visit_team_name"].stringValue
        self.visitTeamCity = data["visit_team_city"].stringValue
        self.visitTeamScore = data["visit_team_score"].intValue
        
        self.state = data["game_state"].stringValue
        self.time = data["game_time"].intValue
    }
    
}
