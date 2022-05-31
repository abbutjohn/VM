//
//  VmAvailableRoomViewModel.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 30/05/2022.
//
import Foundation


class VmAvailableRoomViewModel : NSObject {
    
    var rowsPerSection: [Int] = [0]
    private var apiService : NetworkService!
    var rooms: [VmRoom] = [] {
        didSet {
            self.rowsPerSection = [rooms.count]
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
        NetworkService.request(router: Router.getAvailableRooms) { (result: Result<[VmRoom], Error>) in
            switch result {
            case .success(let resultValue):
                self.rooms = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
}
