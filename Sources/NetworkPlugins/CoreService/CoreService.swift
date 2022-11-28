//
//  File.swift
//  
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation


/// The Core Service can make a single request and also cancel the request.
/// The Result we expect: (Data, URLResponse) or Error.
/// The Core Service should independ from the Fromework and use Swift Language feature so we can
/// have multiple implementation from core service such as Alamofire and URLSession.
///
///
/// - Parameters:
///     - endPoint: The *endPoint* Endpoint of the network.

protocol CoreService {

    typealias response = ((Swift.Result<(Data?, URLResponse?),Error>) -> Void)

    func request(endPoint: NetworkEndPoint,
                 completion: @escaping response)
    func cancelRequest()
}
