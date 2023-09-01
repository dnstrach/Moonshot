//
//  MissionView.swift
//  Moonshot
//
//  Created by Dominique Strachan on 8/30/23.
//

import SwiftUI

struct MissionView: View {
    @StateObject var missionVM: MissionViewModel
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        _missionVM = StateObject(wrappedValue: MissionViewModel(mission: mission, astronauts: astronauts))
    }
    
    //Refactored in MissionViewModel
//    struct CrewMember {
//        let role: String
//        let astronaut: Astronaut
//    }
//
//    let mission: Mission
//    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        Image(missionVM.mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.6)
                            .padding(.top)
                        
                        Text(missionVM.mission.formattedLaunchDate)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(missionVM.mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(missionVM.crew, id: \.role) { crewMember in
//                                NavigationLink {
//                                    AstronautView(astronaut: crewMember.astronaut)
//                                } label: {
//                                    HStack {
//                                        Image(crewMember.astronaut.id)
//                                            .resizable()
//                                            .frame(width: 104, height: 72)
//                                            .clipShape(Capsule())
//                                            .overlay(
//                                                Capsule()
//                                                    .strokeBorder(.white, lineWidth: 1)
//                                            )
//                                        
//                                        VStack(alignment: .leading) {
//                                            Text(crewMember.astronaut.name)
//                                                .foregroundColor(.white)
//                                                .font(.headline)
//                                            
//                                            Text(crewMember.role)
//                                                .foregroundColor(.white)
//                                        }
//                                        .padding(.horizontal, 10)
//                                    }
//                                    .padding()
//                                    
//                                }
//                            }
//                        }
//                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(missionVM.mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
    
    //Refactored in MissionViewModel
//    init(mission: Mission, astronauts: [String: Astronaut]) {
//        self.mission = mission
//        self.crew = mission.crew.map { member in
//            if let astronaut = astronauts[member.name] {
//                return CrewMember(role: member.role, astronaut: astronaut)
//            } else {
//                fatalError("Missing \(member.name)")
//            }
//        }
//    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
        
    }
}
