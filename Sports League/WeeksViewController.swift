import UIKit

class WeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weeks: Array<String>?
    var curIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        
        var currMonth: String
        
        switch month {
        case 1:
            currMonth = "January"
        case 2:
            currMonth = "February"
        case 3:
            currMonth = "March"
        case 4:
            currMonth = "April"
        case 5:
            currMonth = "May"
        case 6:
            currMonth = "June"
        case 7:
            currMonth = "July"
        case 8:
            currMonth = "August"
        case 9:
            currMonth = "September"
        case 10:
            currMonth = "October"
        case 11:
            currMonth = "November"
        case 12:
            currMonth = "December"
        default:
            currMonth = "the month"
        }
        
        weeks = ["1st week of \(currMonth)", "2nd week of \(currMonth)"]
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.curIndex = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverViewController = segue.destination as! LeaguesViewController
        receiverViewController.weekSelected = self.curIndex
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if weeks != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "weekIdentifier", for: indexPath) as! WeeksTableViewCellController
            
            cell.weekLabel.text = weeks![indexPath.row]
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
