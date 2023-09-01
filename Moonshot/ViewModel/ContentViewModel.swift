//
//  ContentViewModel.swift
//  Moonshot
//
//  Created by Dominique Strachan on 9/1/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var switchColumnView = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
}
