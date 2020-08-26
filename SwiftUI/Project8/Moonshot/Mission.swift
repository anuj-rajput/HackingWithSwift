//
//  Mission.swift
//  Moonshot
//
//  Created by Anuj Rajput on 26/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
