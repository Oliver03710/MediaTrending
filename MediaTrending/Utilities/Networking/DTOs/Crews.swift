//
//  Crews.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/07.
//

import Foundation

struct CrewResponse: Codable {
    let cast: [Cast]
}

struct Crew: Codable, Identifiable {
    var uuid = UUID()
    let id: Int
    let knownForDepartment, name: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case knownForDepartment = "known_for_department"
        case name
        case profilePath = "profile_path"
    }
    
    static func getDummy() -> Self {
        return Crew(id: 1, knownForDepartment: "Writing", name: "Craig Mazin", profilePath: "/uEhna6qcMuyU5TP7irpTUZ2ZsZc.jpg")
    }
}
