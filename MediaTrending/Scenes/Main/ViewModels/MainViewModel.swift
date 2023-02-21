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
    @Published var tvs = [TV]()
    @Published var casts = [Int: [Cast]]()
    @Published var crews = [Crew]()
    
    private let tvUrl = EndPoints.mainUrl + "trending/" + URLs.tv.rawValue + Raws.Networking.Period.day + "api_key=" + APIKey.TMDB.rawValue + "&page=\(1)"
    private let movieUrl = EndPoints.mainUrl + "trending/" + URLs.movie.rawValue + Raws.Networking.Period.day + "api_key=" + APIKey.TMDB.rawValue + "&page=\(1)"
    
    init() {
        fetchMedias(.tv)
        fetchMedias(.movie)
    }
    
    func fetchMedias(_ media: Medias) {
        print(tvUrl)
        print(movieUrl)
        switch media {
        case .tv:
            AF.request(tvUrl)
                .publishDecodable(type: TVResponse.self)
                .compactMap { $0.value }
                .map { $0.results }
                .sink(receiveCompletion: { completion in
                    print("Networking Completed‼️")
                    
                }, receiveValue: { [weak self] receivedValue in
//                    print("받은 값: \(receivedValue.count)")
                    receivedValue
                        .forEach { media in
                            self?.tvs.append(media)
                            self?.fetchCasting(id: media.id, media: .tv)
                        }
                    
                })
                .store(in: &subscription)
            
        case .movie:
            AF.request(movieUrl)
                .publishDecodable(type: MovieResponse.self)
                .compactMap { $0.value }
                .map { $0.results }
                .sink(receiveCompletion: { completion in
                    print("Networking Completed‼️")
                    
                }, receiveValue: { [weak self] receivedValue in
//                    print("받은 값: \(receivedValue.count)")
                    receivedValue
                        .forEach { media in
                            self?.movies.append(media)
                            self?.fetchCasting(id: media.id, media: .movie)
                        }
                    
                })
                .store(in: &subscription)
        }
        
    }
    
    func fetchCasting(id: Int, media: URLs) {
        let castUrl = EndPoints.mainUrl + media.rawValue + "/\(id)/credits?api_key=\(APIKey.TMDB.rawValue)&language=en-US"
        
        AF.request(castUrl)
            .publishDecodable(type: CastResponse.self)
            .compactMap { $0.value }
            .map { $0.cast }
            .sink { completion in
                print("Networking Completed‼️")
                
            } receiveValue: { receivedValue in
//                print("받은 값: \(receivedValue)")
                self.casts.updateValue(receivedValue, forKey: id)
            }
            .store(in: &subscription)
    }
}
