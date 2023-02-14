//
//  Movies.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import Foundation

protocol MediaType {
    var adult: Bool { get }
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var date: String { get }
    var posterPath: String { get }
    var backdropPath: String { get }
    var genreIDS: [Int]  { get }
    var voteAverage: Double { get }
}

struct MovieResponse: Codable {
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Movie: Codable, Identifiable, MediaType {
    var uuid = UUID()
    let adult: Bool
    let id: Int
    let title, overview, date, posterPath, backdropPath: String
    let genreIDS: [Int]
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case overview
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case date = "release_date"
        case voteAverage = "vote_average"
    }
    
    static func getDummy() -> Self {
        return Movie(adult: false, id: 1, title: "Dummy", overview: "Overview", date: "2023-01-15", posterPath: "/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg", backdropPath: "/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg", genreIDS: [18, 10759], voteAverage: 8.836)
    }
}
