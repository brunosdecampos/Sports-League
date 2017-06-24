//
//  TableViewCellController.swift
//  Sports League
//
//  Created by Priscila Campos on 2017-06-23.
//  Copyright © 2017 Bruno Campos. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var fruit: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
