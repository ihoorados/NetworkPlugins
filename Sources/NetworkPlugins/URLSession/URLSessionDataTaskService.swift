//
//  File.swift
//  
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation

class URLSessionDataTaskService: CoreService {

    /* ////////////////////////////////////////////////////////////////////// */
    // MARK: Dependency Injection
    /* ////////////////////////////////////////////////////////////////////// */

    private var session : URLSession
    private var tools: NetworkTools = NetworkTools()

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    /* ////////////////////////////////////////////////////////////////////// */
    // MARK: Methods
    /* ////////////////////////////////////////////////////////////////////// */

    private var task: URLSessionTask?

    //MARK: Start Task
    func request(endPoint: NetworkEndPoint, completion: @escaping response) {

        task = session.dataTask(with: endPoint.buildURLRequest(),
                                completionHandler: { (data, response, error) in

            if let error = error {

                completion(.failure(error))
            }
            completion(.success((data, response)))
        })

        // MARK: Start Task
        task?.resume()
    }

    func cancelRequest() {
        // MARK: Cancel Data Task
        task?.cancel()
    }

}
