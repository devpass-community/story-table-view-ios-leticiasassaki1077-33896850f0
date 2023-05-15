//
//  Service.swift
//  EvercodeApp
//
//  Created by Rodrigo Soares on 30/03/23.
//

import Foundation

struct Service {
    
    func fetchData(completion: ([String]?)->Void) {
        
        completion(["List Item 1", "List Item 2", "List Item 3", "List Item 4", "List Item 5", "List Item 6", "List Item 7", "List Item 8", "List Item 9", "List Item 10"])
    }
}
