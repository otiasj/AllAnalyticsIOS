//
//  FirebaseHandler.swift
//  AllAnalytics
//
//  Created by Julien Saito on 6/22/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHandler : AnalyticHandler {
    
    func initialize() {
        FirebaseApp.configure()
    }
    
    func tagEvent(name: String, data: [String : Any?]?) {
        Analytics.logEvent(sanitize(name: name), parameters: sanitize(data: data))
    }
    
    func sanitize(name: String) -> String {
        return name.replacingOccurrences(of: "[^A-Za-z0-9_]", with: "", options: .regularExpression, range: nil)
    }
    
    func sanitize(data: [String: Any?]?) -> [String: Any]? {
        if let data = data {
            var newParameters = [String:Any]()
            for param in data {
                if param.1 != nil {
                    newParameters[param.0] = param.1
                } else {
                    newParameters[param.0] = "nil"
                }
            }
            return newParameters
        } else {
            return nil
        }
        
    }
}
