//
//  VmContactImageTableviewCell.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 30/05/2022.
//

import UIKit

class VmContactImageTableviewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var avatarUrl: String!{
        
        didSet {
            self.avatarImageView.load(urlString: avatarUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
