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
    
    init(leagueIndex: Int, data: JSON) {
//        self.homeTeamLogo = data["games"].arrayValue[0]["home_team_logo"].stringValue
//        self.homeTeamName = data["games"].arrayValue[0]["home_team_name"].stringValue
//        self.homeTeamCity = data["games"].arrayValue[0]["home_team_city"].stringValue
//        self.homeTeamScore = data["games"].arrayValue[0]["home_team_score"].intValue
//        
//        self.visitTeamLogo = data["games"].arrayValue[0]["visit_team_logo"].stringValue
//        self.visitTeamName = data["games"].arrayValue[0]["visit_team_name"].stringValue
//        self.visitTeamCity = data["games"].arrayValue[0]["visit_team_city"].stringValue
//        self.visitTeamScore = data["games"].arrayValue[0]["visit_team_score"].intValue
//        
//        self.state = data["games"].arrayValue[0]["game_state"].stringValue
//        self.time = data["games"].arrayValue[0]["game_time"].intValue
        
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
        
        // let gameDataArray = data["games"].arrayValue
        
//        for gameData in gameDataArray {
//            //print(gameData)
//        }
    }
    
}
