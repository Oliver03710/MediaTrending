//
//  DetailViewModel.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import Foundation
import Combine

import Alamofire

final class DetailViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var media: MediaType
    @Published var casts = [Cast]()
    @Published var crews = [Crew]()
    
    init(_ media: MediaType, casts: [Cast], kind: URLs) {
        self.media = media
        self.casts = casts
        fetchCrews(id: media.id, media: kind)
    }
    
    func fetchCrews(id: Int, media: URLs) {
        let crewUrl = EndPoints.mainUrl + media.rawValue + "/\(id)/credits?api_key=\(APIKey.TMDB.rawValue)&language=en-US"
        
        AF.request(crewUrl)
            .publishDecodable(type: CrewResponse.self)
            .compactMap { $0.value }
            .map { $0.crew }
            .sink { completion in
                print("Networking Crew Completed‼️")
                
            } receiveValue: { receivedValue in
                print("받은 값: \(receivedValue)")
                self.crews.append(contentsOf: receivedValue)
            }
            .store(in: &subscription)
    }
}
