//
//  FabricsHandler.swift
//  AllAnalytics
//
//  Created by Julien Saito on 6/22/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import Foundation
import Fabric
import Answers


class FabricsHandler: AnalyticHandler {

    func initialize() {
        Fabric.with([Answers.self])
    }

    func tagEvent(name: String, data: [String: Any?]?) {
        Answers.logCustomEvent(withName: name, customAttributes: sanitize(data: data))
    }

    private func sanitize(data: [String: Any?]?) -> [String: Any]? {
        if let data = data {
            var newParameters = [String: Any]()
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
