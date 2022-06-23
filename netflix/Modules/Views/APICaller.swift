//
//  APICaller.swift
//  netflix
//
//  Created by Ankit Man Shakya on 23/06/2022.
//

import Foundation

struct Constants {
    static let API_KEY: String = "6ec7178547ff06841e5418f66c05b2ec"
    static let baseURL: String = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

enum APIpath {
    case getTrending
    
    var path: String {
        switch self {
        case .getTrending:
            return "/3/trending/all/day?api_key="
        }
    }
    
    var url: String {
            return Constants.baseURL+self.path+Constants.API_KEY
    }
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: APIpath.getTrending.url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                completion(.success(results.results))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
