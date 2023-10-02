//
//  MapAPIConfig.swift
//  SIXTMap
//
//  Created by Amir on 10/2/23.
//

import Foundation
struct MapAPIConfig: APIConfigProtocol {
    var url: String = "/codingtask/cars"
    var method: RequestMethod = .get
    var header: [String : String] = ["Content-Type": "application/json", "Accept": "*/*"]
    var body: String?
    
    
}
