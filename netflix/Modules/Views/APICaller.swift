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
    case getTrendingMovie
    case getTrendingTv
    case getUpcomming
    case getPopular
    case getTopRated
    
    var path: String {
        switch self {
        case .getTrendingMovie:
            return "/3/trending/movie/day?api_key="
        case .getTrendingTv:
            return "/3/trending/tv/day?api_key="
        case.getUpcomming:
            return "/3/movie/upcoming?api_key="
        case.getPopular:
            return "/3/movie/popular?api_key="
        case .getTopRated:
            return "/3/movie/top_rated?api_key="
        }
    }
    
    var edingPath: String {
        switch self{
        case .getUpcomming:
            return "&language=en-US&page=1"
        case .getPopular:
            return "&language=en-US&page=1"
        case .getTopRated:
            return "&language=en-US&page=1"
        default:
            return ""
        }
    }
    
    var url: String {
        return Constants.baseURL + self.path+Constants.API_KEY + self.edingPath
    }
    
}

class APICaller {
    static let shared = APICaller()
    
    func apiCall (url: String, completion: @escaping (Result< [Movie] , Error >) -> Void ) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
