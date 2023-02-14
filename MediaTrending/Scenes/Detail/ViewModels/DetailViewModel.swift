//
//  DetailViewModel.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var mediaID: Int
    @Published var media: MediaType
    @Published var casts = [Cast]()
    @Published var crews = [Crew]()
    
    init(_ id: Int, media: MediaType, casts: [Cast], crews: [Crew]) {
        mediaID = id
        self.media = media
        self.casts = casts
        self.crews = crews
    }
}
