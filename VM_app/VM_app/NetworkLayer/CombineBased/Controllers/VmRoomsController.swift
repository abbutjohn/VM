//
//  VmRoomsController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation


import Foundation
import Combine


// MARK: - Rooms Controller

protocol RoomsControllerProtocol: AnyObject {

    func getAVailableRooms() -> AnyPublisher<[VmRoom], Error>
}

final class VmRoomsController: RoomsControllerProtocol {
    
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getAVailableRooms() -> AnyPublisher<[VmRoom], Error> {
        
        let endpoint = VmEndpoint.rooms()
        
        return networkController.get(type: [VmRoom].self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }    
}
