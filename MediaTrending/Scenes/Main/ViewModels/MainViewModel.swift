//
//  MediaViewModel.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import Foundation
import Combine

import Alamofire

final class MainViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var movies = [Movie]()
    @Published var casts = [Int: [Cast]]()
    
    private let mediaUrl = EndPoints.mainUrl + "trending/" + URLs.tv.rawValue + Raws.Networking.Period.day + "api_key=" + APIKey.TMDB.rawValue + "&page=\(1)"
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        AF.request(mediaUrl)
            .publishDecodable(type: MovieResponse.self)
            .compactMap { $0.value }
            .map { $0.results }
            .sink(receiveCompletion: { completion in
                print("Networking Completed‼️")
                
            }, receiveValue: { [weak self] receivedValue in
                print("받은 값: \(receivedValue.count)")
                receivedValue
                    .forEach { movie in
                        self?.movies.append(movie)
                        self?.fetchCrews(id: movie.id)
                    }
                
            })
            .store(in: &subscription)
    }
    
    func fetchCrews(id: Int) {
        let crewUrl = EndPoints.mainUrl + URLs.tv.rawValue + "/\(id)/credits?api_key=\(APIKey.TMDB.rawValue)&language=en-US"
        
        AF.request(crewUrl)
            .publishDecodable(type: CastResponse.self)
            .compactMap { $0.value }
            .map { $0.cast }
            .sink { completion in
                print("Networking Completed‼️")
                
            } receiveValue: { receivedValue in
                print("받은 값: \(receivedValue)")
                self.casts.updateValue(receivedValue, forKey: id)
            }
            .store(in: &subscription)
    }
}
