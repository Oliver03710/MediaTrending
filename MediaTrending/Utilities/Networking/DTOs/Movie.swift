//
//  Movies.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Movie: Codable, Identifiable {
    var uuid = UUID()
    let adult: Bool
    let id: Int
    let name, overview, firstAirDate, posterPath, backdropPath: String
    let genreIDS: [Int]
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case overview
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
    }
    
    static func getDummy() -> Self {
        return Movie(adult: false, id: 1, name: "Dummy", overview: "Overview", firstAirDate: "2023-01-15", posterPath: "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg", backdropPath: "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg", genreIDS: [18, 10759], voteAverage: 8.836)
    }
}
