import UIKit

class WeeksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weeks: Array<String>?
    var curIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weeks = ["1st week", "2nd week"]
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
