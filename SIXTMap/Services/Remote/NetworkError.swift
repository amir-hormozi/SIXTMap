//
//  NetworkError.swift
//  SpaceX
//
//  Created by Amir on 8/12/23.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Cant access to server"
    case requestFailed = "cant access to server"
    case invalidResponse = "Server error"
}
