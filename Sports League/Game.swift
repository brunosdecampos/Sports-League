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
    
    init(league: String, data: JSON) {
        self.homeTeamLogo = data[league]["home_team_logo"].stringValue
        self.homeTeamName = data[league]["home_team_name"].stringValue
        self.homeTeamCity = data[league]["home_team_city"].stringValue
        self.homeTeamScore = data[league]["home_team_score"].intValue
        
        self.visitTeamLogo = data[league]["visit_team_logo"].stringValue
        self.visitTeamName = data[league]["visit_team_name"].stringValue
        self.visitTeamCity = data[league]["visit_team_city"].stringValue
        self.visitTeamScore = data[league]["visit_team_score"].intValue
        
        self.state = data[league]["game_state"].stringValue
        self.time = data[league]["game_time"].intValue
        
        print("Data: \(data)")
    }
    
}
