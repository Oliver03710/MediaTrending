//
//  Casts.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/07.
//

import Foundation

struct CastResponse: Codable {
    let cast: [Cast]
}

struct Cast: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let profilePath: String?
    let character: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
        case character
    }
    
    static func getDummy() -> [Self] {
        return [Cast(id: 1, name: "Dummys 1231231", profilePath: "/hoP3vT6OBMNCUFTqlTDcd2X3y77.jpg", character: "Joel Miller"),
                Cast(id: 2, name: "Dummy2", profilePath: "/hoP3vT6OBMNCUFTqlTDcd2X3y77.jpg", character: "Joel Miller"),
                Cast(id: 3, name: "Dummy3", profilePath: "/hoP3vT6OBMNCUFTqlTDcd2X3y77.jpg", character: "Joel Miller"),
                Cast(id: 4, name: "Dummy4", profilePath: "/hoP3vT6OBMNCUFTqlTDcd2X3y77.jpg", character: "Joel Miller")]
    }
}
