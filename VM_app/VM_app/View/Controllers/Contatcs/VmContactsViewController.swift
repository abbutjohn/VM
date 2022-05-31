//
//  ViewController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 27/05/2022.
//

import UIKit

class VmContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var activityView: UIActivityIndicatorView?
    private var viewModel : VmContatcsViewModel?


    //MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        bindViewModel()
        self.showActivityIndicator()
    }

    //MARK: Binding with ViewModel
    
    func bindViewModel(){
        self.viewModel =  VmContatcsViewModel()
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

extension VmContactsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.contatcs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VmPeopleTableViewCell") as! VmContatcTableViewCell
        
        if let conatct = self.viewModel?.contatcs[indexPath.row] {
            
            cell.nameLabel?.text        =   conatct.firstName +  " " + conatct.lastName
            cell.avatarUrl              =   conatct.avatar

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let details = self.viewModel?.contatcs[indexPath.row] {
            
            let contactDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VmContactDetailsViewController") as! VmContactDetailsViewController
            contactDetails.contact = details
            self.navigationController?.pushViewController(contactDetails, animated: true)
        }
    }
}
