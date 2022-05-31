//
//  VmContactDetailsViewController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 30/05/2022.
//

import UIKit

class VmContactDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contact: VmContact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
//MARK: TableViewcontroller

extension VmContactDetailsViewController: UITableViewDataSource, UITableViewDelegate{
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            
            return 1

        }else {
            return 5

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactImageTableviewCell") as! VmContactImageTableviewCell
            
            if let details = self.contact {
                
                cell.nameLabel?.text        =   details.firstName +  " " + details.lastName
                cell.avatarUrl              =   details.avatar
        

            }
            return cell
        }
        else{
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
                
                if let details = self.contact {
                    
                    cell.nameLabel?.text        =   "Job title"
                    cell.valuLabel?.text        =   details.jobtitle
            

                }
                return cell
                
            }
            else if indexPath.row == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
                
                if let details = self.contact {
                    
                    cell.nameLabel?.text        =   "Email"
                    cell.valuLabel?.text        =   details.email
            
            

                }
                return cell
                
                
            }
            else if indexPath.row == 3 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
                
                if let details = self.contact {
                    
                    cell.nameLabel?.text        =   "Created date"
                    cell.valuLabel?.text        =   details.createdAt.convertToDate()
            

                }
                return cell
                
                
            }
            else if indexPath.row == 4 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
                
                if let details = self.contact {
                    
                    cell.nameLabel?.text        =   "Favourite Color"
                    cell.valuLabel?.text        =   details.favouriteColor
            

                }
                return cell
                
                
            }
            else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "VmContactLabelTableViewCell") as! VmContactLabelTableViewCell
                
                if let details = self.contact {
                    
                    cell.nameLabel?.text        =   "Id"
                    cell.valuLabel?.text        =   details.id
            

                }
                return cell
                
            }
        }
    }
    
}
