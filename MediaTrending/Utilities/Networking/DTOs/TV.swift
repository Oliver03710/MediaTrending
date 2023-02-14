//
//  TV.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import Foundation

struct TVResponse: Codable {
    let results: [TV]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct TV: Codable, Identifiable, MediaType {
    var uuid = UUID()
    let adult: Bool
    let id: Int
    let title, overview, date, posterPath, backdropPath: String
    let genreIDS: [Int]
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title = "name"
        case overview
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case date = "first_air_date"
        case voteAverage = "vote_average"
    }
    
    static func getDummy() -> Self {
        return TV(adult: false, id: 1, title: "Dummy", overview: "Overview", date: "2023-01-15", posterPath: "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg", backdropPath: "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg", genreIDS: [18, 10759], voteAverage: 8.836)
    }
}
