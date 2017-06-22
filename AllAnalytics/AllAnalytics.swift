//
//  AllAnalytics.swift
//  AllAnalytics
//
//  Created by Julien Saito on 6/21/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import Foundation

public class AllAnalytics {
    
    private var handlers : [AnalyticTarget : AnalyticHandler] = [:]
    
    static let sharedInstance = AllAnalytics()
    
    init() {
        let firebase = FirebaseHandler()
        firebase.initialize()
        addHandler(target: AnalyticTarget.firebase, handler: firebase)
        
        let fabric = FabricsHandler()
        fabric.initialize()
        addHandler(target: AnalyticTarget.fabric, handler: fabric)
    }
    
    func addHandler(target : AnalyticTarget, handler : AnalyticHandler) {
        handlers[target] = handler
    }
    
    func newEvent(name: String) -> AnalyticEvent {
        return AnalyticEvent(sender: self, name: name)
    }
    
    func send(target: AnalyticTarget? = AnalyticTarget.all, name : String, data: [String : Any?]?) {
        if (target == AnalyticTarget.all) {
            for handler in handlers {
                handler.value.tagEvent(name : name, data : data)
            }
        } else {
            if let target = target, let handler = handlers[target] {
                handler.tagEvent(name : name, data : data)
            }
        }
    }
}
