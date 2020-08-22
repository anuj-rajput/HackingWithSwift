//
//  Petition.swift
//  GrandCentralDispatch
//
//  Created by Anuj Rajput on 22/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
