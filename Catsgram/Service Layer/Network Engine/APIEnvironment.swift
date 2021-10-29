//
//  APIEnvironment.swift
//  Catsgram
//
//  Created by Oleksndr Bogdanov on 21.10.21.
//

import Foundation

struct APIEnvironment {
    var baseUrl: URL
}

extension APIEnvironment {
    static let prod = APIEnvironment(baseUrl: URL(string: "http://192.168.1.17:8081/api/v1")!)
    static let local = APIEnvironment(baseUrl: URL(string: "http://localhost:8080/api/v1")!)
}
