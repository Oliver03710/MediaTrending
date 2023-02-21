//
//  MediaViewModel.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/22.
//

import Foundation
import Combine

import Alamofire

final class MediaViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var trailersUrl = String()
    
    init() {
        
    }
    
    func fetchTrailerData(_ id: Int, kind: URLs) {
        let trailerUrl = "\(EndPoints.mainUrl)\(kind.rawValue)/\(id)/videos?api_key=\(APIKey.TMDB.rawValue)&language=en-US"
        AF.request(trailerUrl)
            .publishDecodable(type: TrailerResponse.self)
            .compactMap { $0.value }
            .map { $0.results }
            .sink { completion in
                print("Networking Completed‼️")
                
            } receiveValue: { [weak self] receivedValue in
                print("받은 값: \(receivedValue)")
                guard let url = receivedValue.randomElement()?.key else { return }
                self?.trailersUrl = url
            }
            .store(in: &subscription)
    }
}
