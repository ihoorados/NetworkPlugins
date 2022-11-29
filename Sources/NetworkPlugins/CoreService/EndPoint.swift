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

    var path:       String             { get set }
    var host:       String             { get set }
    var scheme:     String             { get set }
    var url:        URL                { get set }
    var method:     HttpMethod         { get set }
    var headers:    HttpHeaders        { get set }
    var parameters: HttpParameters     { get set }
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
