//
//  AnalyticHandler.swift
//  AllAnalytics
//
//  Created by Julien Saito on 6/21/17.
//  Copyright © 2017 otiasj. All rights reserved.
//

import Foundation


protocol AnalyticHandler {
    func initialize()
    func tagEvent(name: String, data: [String : Any?]?)
}
