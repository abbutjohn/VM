//
//  VmContatcTableViewCell.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 30/05/2022.
//

import UIKit

class VmContatcTableViewCell: UITableViewCell {
    

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var avatarUrl: String!{
        
        didSet {
            
            if avatarUrl != nil {
                
                self.avatarImageView.load(urlString: avatarUrl)
            }
            else{
                
                self.avatarImageView.image = UIImage(named: "default")
            }
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
