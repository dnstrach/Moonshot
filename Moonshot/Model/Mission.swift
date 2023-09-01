//
//  Mission.swift
//  Moonshot
//
//  Created by Dominique Strachan on 8/30/23.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
    
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]            
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var abbreviatedFormattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
    
}
