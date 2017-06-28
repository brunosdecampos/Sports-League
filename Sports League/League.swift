import Foundation

class League {
    
    var name: String
    var image: String
    
    init(data: JSON) {
        
        self.name = data["name"].stringValue
        self.image = data["image"].stringValue
        
    }
    
}
