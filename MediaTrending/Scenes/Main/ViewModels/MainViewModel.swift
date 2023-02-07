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
    
    @Published var movies = [Movies]()
    private let url = EndPoints.TMDBUrl + URLs.tv.rawValue + Raws.Networking.Period.day + "api_key=" + APIKey.TMDB.rawValue + "&page=\(1)"
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        print(url)
        AF.request(url)
            .publishDecodable(type: Movies.self)
            .compactMap { $0.value }
            .map { $0.results }
            .sink(receiveCompletion: { completion in
                print("Networking Completed‼️")
                
            }, receiveValue: { receivedValue in
                print("받은 값: \(receivedValue.count)")
                dump(receivedValue)
            })
            .store(in: &subscription)
    }
    
    
    
    
    
}
