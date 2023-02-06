//
//  Movies.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import Foundation

struct Movies: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Result: Codable {
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
}
