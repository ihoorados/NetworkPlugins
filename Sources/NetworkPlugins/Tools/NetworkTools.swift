//
//  NetworkTools.swift
//  
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation

struct NetworkTools {

    // Model To Json (Dictionary)
    static func modelToJson<T: Codable>(model: T) -> [String: Any]?{

        do {

            var json: [String: Any]? = [:]
            let jsonEncoder: JSONEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(model)
            json = (try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any])
            return json
        } catch{

            return nil
        }
    }
}
