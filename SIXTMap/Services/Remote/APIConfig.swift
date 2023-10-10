//
//  APIConfig.swift
//  SpaceX
//
//  Created by Amir on 8/12/23.
//

protocol APIConfigProtocol {
    var url: String { set get}
    var method: RequestMethod { set get}
    var header: [String: String] { set get}
    var body: String? { set get}
}
