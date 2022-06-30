//
//  MissionCrewView.swift
//  Moonshot
//
//  Created by Angel Terziev on 26.06.22.
//

import SwiftUI

struct MissionCrewView: View {
    
    let crew: [MissionView.CrewMember]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember  in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
}

struct MissionCrewView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")

    static let crew:[MissionView.CrewMember] = missions[0].crew.map { member in
        if let astronaut = astronauts[member.name] {
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }

    static var previews: some View {
        MissionCrewView(crew: crew)
    }
}
