//
//  Movies.swift
//  netflix
//
//  Created by Ankit Man Shakya on 23/06/2022.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_country: String?
    let original_language: String?
    let original_name: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
