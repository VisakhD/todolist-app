//
//  ToDoItemTableViewCell.swift
//  coredata uikit
//
//  Created by Visakh D on 08/10/21.
//

import UIKit

class ToDoItemTableViewCell: UITableViewCell {
 
 
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellContent: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
}
