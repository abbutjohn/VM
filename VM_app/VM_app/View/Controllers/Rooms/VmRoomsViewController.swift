//
//  VmRoomsViewController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 30/05/2022.
//

import UIKit

class VmRoomsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var activityView: UIActivityIndicatorView?
    private var viewModel : VmAvailableRoomViewModel?
    

    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        self.title = "Rooms"
        self.showActivityIndicator()
    }

    //MARK: Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  VmAvailableRoomViewModel()
        self.viewModel?.loadData = {
            self.tableView.reloadData()
        }
        self.viewModel?.hideActivityIndicator = {
            self.hideActivityIndicator()
        }
    }
    
    //MARK: Funtions

    func showActivityIndicator() {
        
        activityView            = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityView?.center    = self.view.center
        activityView?.color     = .systemBlue
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}
//MARK: TableViewcontroller

extension VmRoomsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel?.rooms.count ?? 0
    }
    
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let details =  self.viewModel?.rooms[section] {
            
            return "Room ID     " + details.id
            
        }
        return ""
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmRoomTableViewCell") as! VmRoomTableViewCell
                        
            if let details =  self.viewModel?.rooms[indexPath.section] {
                
                cell.nameLabel?.text        =   "Created"
                cell.valueLabel?.text        =   details.createdAt.convertToDate()
                
                
            }
            return cell
            
        }
        else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmRoomTableViewCell") as! VmRoomTableViewCell
            
            if let details =  self.viewModel?.rooms[indexPath.section] {
                
                cell.nameLabel?.text        =   "Is occupied"
                cell.valueLabel?.text        =   details.isOccupied ? "Yes" : "No"
                
                
            }
            return cell
            
            
        }
        else  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VmRoomTableViewCell") as! VmRoomTableViewCell
            
            if let details =  self.viewModel?.rooms[indexPath.section] {
                
                cell.nameLabel?.text        =   "Max Occupancy"
                cell.valueLabel?.text       =   String (details.maxOccupancy)
                
                
            }
            return cell
            
            
        }
      
    }
}
extension String {

  func convertToDate() -> String {
   
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
      if let dt = dateFormatter.date(from: self) {
          dateFormatter.dateFormat = "MMM dd,yyyy"
          let formatedStringDate = dateFormatter.string(from: dt)
              return formatedStringDate
      }
    
   
      return "01-01-70"
  }
}
