//
//  peopleController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation
import Combine


// MARK: - Users Controller

protocol UsersControllerProtocol: AnyObject {

    func getUsers() -> AnyPublisher<[VmUser], Error>
}

final class VmUsersController: UsersControllerProtocol {
    
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getUsers() -> AnyPublisher<[VmUser], Error> {
        
        let endpoint = VmEndpoint.users()
        
        return networkController.get(type: [VmUser].self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
}
