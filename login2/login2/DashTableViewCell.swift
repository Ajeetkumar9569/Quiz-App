//
//  DashTableViewCell.swift
//  login2
//
//  Created by students on 16/04/24.
//

import UIKit

class DashTableViewCell: UITableViewCell {

  
    @IBOutlet weak var Buttoncircle: UIButton!
    
    @IBAction func Nextbutton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var namelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
