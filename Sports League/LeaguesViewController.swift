//
//  ViewController.swift
//  Sports League
//
//  Created by Priscila Campos on 2017-06-23.
//  Copyright © 2017 Bruno Campos. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fruit1: Array<String>?
    var fruit2: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruit1 = ["Apple", "Banana"]
        fruit2 = ["Orange"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruit1?.count ?? 0
        } else {
            return fruit2?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if fruit1 != nil && fruit2 != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "weeks", for: indexPath) as! TableViewCellController
            
            if indexPath.section == 0 {
                cell.fruit.image = UIImage(named: (fruit1![indexPath.row]) + ".png")
                cell.name.text = fruit1![indexPath.row]
            } else {
                cell.fruit.image = UIImage(named: (fruit2![indexPath.row]) + ".png")
                cell.name.text = fruit2![indexPath.row]
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(fruit1![indexPath.row])
        } else {
            print(fruit2![indexPath.row])
        }
        
        print(indexPath.section)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

