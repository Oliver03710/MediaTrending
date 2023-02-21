//
//  Trailers.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/22.
//

import Foundation

struct TrailerResponse: Codable {
    let results: [Trailer]
}

struct Trailer: Codable, Identifiable, Hashable {
    let id = UUID()
    let name, key, type: String

    enum CodingKeys: String, CodingKey {
        case name, key, type
    }
    
    static func getDummy() -> [Self] {
        return [Trailer(name: "Official Trailer", key: "OCSnxXtjFL0", type: "Trailer")]
    }
}
