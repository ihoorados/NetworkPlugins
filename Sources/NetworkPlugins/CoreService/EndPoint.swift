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

public protocol NetworkEndPoint {

    var path:       String             { get }
    var host:       String             { get }
    var scheme:     String             { get }
    var url:        URL                { get }
    var method:     HttpMethod         { get }
    var headers:    HttpHeaders        { get }
    var parameters: HttpParameters     { get }
}
extension NetworkEndPoint{

    func buildURLRequest(with url: URL) -> URLRequest {

        let request = URLRequest(url: url)
        return request
    }

    func buildURLRequest() -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.allHTTPHeaderFields = self.headers
        return request
    }
}
