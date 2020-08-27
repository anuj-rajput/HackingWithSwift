//
//  Astronaut.swift
//  Moonshot
//
//  Created by Anuj Rajput on 26/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

extension Astronaut {
    func missions() -> [Mission] {
        var crewMission = [Mission]()
        
        if let missions: [Mission] = Bundle.main.decode("missions.json") {
            
            // Brute force approach to filter astronauts
            // O(n^2) would be the time complexity
            // TODO: Find a better optimized way
            for mission in missions {
                for crew in mission.crew {
                    if crew.name == self.id {
                        crewMission.append(mission)
                    }
                }
            }
        }
        
        return crewMission
    }
}
