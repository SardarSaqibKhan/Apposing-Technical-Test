//
//  AddSkillsCell.swift
//  Apposing Technical Test
//
//  Created by sardar saqib on 22/05/2022.
//

import UIKit


class AddSkillsCell: UITableViewCell {

    @IBOutlet weak var selectedOrUnselectImg: UIImageView!
    @IBOutlet weak var skillnameLbl: UILabel!
    @IBOutlet weak var highlightedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            selectedOrUnselectImg.image = UIImage(named: "icons8-done")
            highlightedView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.3450980392, blue: 0.1098039216, alpha: 1)
        } else {
            selectedOrUnselectImg.image = UIImage(named: "icons8-plus")
            highlightedView.backgroundColor = .clear
        }
        
    }
    

    
}
