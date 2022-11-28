//
//  File.swift
//  
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation

public class URLSessionDataTaskService: CoreService {

    /* ------------------------------- */
    // MARK: Dependency Injection
    /* ------------------------------- */

    private var session : URLSession

    public init(session: URLSession = URLSession.shared) {

        self.session = session
    }

    /* ------------------------------- */
    // MARK: Prpperties
    /* ------------------------------- */

    private var task: URLSessionTask?

    /* ------------------------------- */
    // MARK: Functions
    /* ------------------------------- */

    //MARK: Start Task
    public func request(endPoint: NetworkEndPoint, completion: @escaping response) {

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

    public func cancelRequest() {
        // MARK: Cancel Data Task
        task?.cancel()
    }

}
