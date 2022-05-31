//
//  VmEndPoint.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 28/05/2022.
//

import Foundation
import Combine


// MARK: - Endpoint
/// Reusable base Endpoint struct
struct VmEndpoint {
    
    var path: String
    var queryItems: [URLQueryItem] = []
    var headers : [String : Any]
    var body : [String : String]
}

/// Dummy API specific Endpoint extension

extension VmEndpoint {
    
    var url: URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "61e947967bc0550017bc61bf.mockapi.io"
        components.path =  path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }

}

/// Dummy API endpoints

extension VmEndpoint {
    

    static func users() -> Self {
        
        return VmEndpoint(path: "/api/v1/people",
                          queryItems: [],
                          headers: [:],
                          body: [:])
    }
    
    
    static func rooms() -> Self {
        
        return VmEndpoint(path: "/api/v1/rooms",
                          queryItems: [],
                          headers: [:],
                          body: [:])
    }
   
}
