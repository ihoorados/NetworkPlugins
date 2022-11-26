//
//  EndPoint.swift
//  
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import Foundation

public typealias HttpParameters = [String: Any]?
public typealias HttpHeaders    = [String: String]?

public enum HttpMethod: String {

    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

protocol NetworkEndPoint {

    var path:       String             { get }
    var host:       String             { get }
    var scheme:     String             { get }
    var method:     HttpMethod         { get }
    var baseURL:    URL?               { get }
    var headers:    HttpHeaders        { get }
    var parameters: HttpParameters     { get }
}
