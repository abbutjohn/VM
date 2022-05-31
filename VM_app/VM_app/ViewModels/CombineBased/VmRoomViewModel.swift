//
//  VmRoomViewModel.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Combine

final class VmRoomViewModel : ObservableObject {
    
    // MARK: Subscribers
    
    private var cancellable : AnyCancellable?
    
    // MARK: Publishers
    
    @Published var rooms = [VmRoom]()
    @Published var showProgressView = false
    @Published var showErrorAlert = false
    
    // MARK: varibles
    
    var roomClient : RoomsControllerProtocol
    var isLoadedPeople = false
    
    init(roomController : RoomsControllerProtocol = VmRoomsController(networkController: NetworkController())){
        
        roomClient  = roomController
        
    }
    
    // MARK: API calls
    
    func fetchRooms() {
        
        cancellable = roomClient.getAVailableRooms()
            .sink(receiveCompletion: { [weak self] result in
                
                switch result {
                case .failure(let err):
                    print(err)
                    self?.showErrorAlert = true
                case .finished: break
                }
                
                
            }, receiveValue: { [weak self] result in
                
                if  result.count != 0 {
                    
                    self?.rooms = result
                }
            })
    }
}


