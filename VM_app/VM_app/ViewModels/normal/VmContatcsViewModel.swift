//
//  VmRoomViewModel.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//


import Foundation


class VmContatcsViewModel : NSObject {
    
    var rowsPerSection: [Int] = [0]
    private var apiService : NetworkService!
    var contatcs: [VmContact] = [] {
        didSet {
            self.rowsPerSection = [contatcs.count]
            self.loadData()
        }
    }
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  NetworkService()
        self.callFuncToGetBooksData()
    }
    
    func callFuncToGetBooksData() {
        NetworkService.request(router: Router.getContatcs) { (result: Result<[VmContact], Error>) in
            switch result {
            case .success(let resultValue):
                self.contatcs = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
}
