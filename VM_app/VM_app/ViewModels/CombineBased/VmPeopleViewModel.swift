//
//  VmPeopleViewModel.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Combine

final class VmPeopleViewModel : ObservableObject {
    
    // MARK: Subscribers
    
    private var cancellable : AnyCancellable?
    
    // MARK: Publishers
    
    @Published var users = [VmUser]()
    @Published var showProgressView = false
    @Published var showErrorAlert = false
    
    // MARK: varibles
    
    var peopleClient : UsersControllerProtocol
    var isLoadedPeople = false
    
    init(peoplesController : UsersControllerProtocol = VmUsersController(networkController: NetworkController())){
        
        peopleClient  = peoplesController
        
    }
    
    // MARK: API calls
    
    func fetchPeoples() {
        
        cancellable = peopleClient.getUsers()
            .sink(receiveCompletion: { [weak self] result in
                
                switch result {
                case .failure(_):
                    self?.showErrorAlert = true
                case .finished: break
                }
                
                
            }, receiveValue: { [weak self] result in
                
                if  result.count != 0 {
                    
                    self?.users = result
                }
            })
    }
}


