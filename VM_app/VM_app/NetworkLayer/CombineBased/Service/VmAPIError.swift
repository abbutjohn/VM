//
//  VmAPIError.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 28/05/2022.
//

import Foundation

enum VmAPIError : Error {
    case rateLimited(String)
    case serverBusy(String)
    case sothingwentWrong(String)
    case responseUnsuccessfull(String)
    case invalidData(String)
    case jsonParsingFailure(String)
}

extension VmAPIError {
    
    var errorDescription : String {
        
        return "error"
    }
}
