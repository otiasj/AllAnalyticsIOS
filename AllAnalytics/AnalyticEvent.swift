//
//  AnalyticEvent.swift
//  AllAnalytics
//
//  Created by Julien Saito on 6/21/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import Foundation


public class AnalyticEvent {
    var name: String
    var data: [String: Any?]?
    var targets: Set<AnalyticTarget>?
    private var sender: AllAnalytics

    /// Create an analytic event with a name
    init(sender: AllAnalytics, name: String) {
        self.sender = sender
        self.name = name
        targets = Set<AnalyticTarget>()
    }

    /// add some data to that event
    func with(data: [String: Any?]) -> AnalyticEvent {
        self.data = data
        return self
    }
    
    func append(key: String, value: Any?) -> AnalyticEvent {
        self.data?[key] = value
        return self
    }

    /// [optional] specify to what platform to send the event
    func to(_ targets: [AnalyticTarget]) -> AnalyticEvent {
        for target in targets {
            self.targets?.insert(target)
        }
        return self
    }

    /// [optional] specify to what platform to send the event
    func to(_ target: AnalyticTarget) -> AnalyticEvent {
        self.targets?.insert(target)
        return self
    }


    /// send the event
    func send() {
        if let targets = self.targets, targets.count > 0 {
            for target in targets {
                self.sender.send(target: target, name: name, data: data)
            }
        } else {
            self.sender.send(target: AnalyticTarget.all, name: name, data: data)
        }
    }
}
