//
//  MainView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import SwiftUI

enum Medias: String, CaseIterable {
    case tv = "TV"
    case movie = "MOVIE"
}

struct MainView: View {
    
    private let intro: LocalizedStringKey = "intro"
    
    @State private var chosen = 0
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                    LazyVStack {
                        if chosen == 0 {
                            ForEach(viewModel.tvs) { media in
                                if let casting = viewModel.casts[media.id] {
                                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(media, casts: casting, kind: .tv))) {
                                        MediaView(media: media, casts: casting, kind: .tv, viewModel: MediaViewModel())
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding()
                        } else {
                            
                            ForEach(viewModel.movies) { media in
                                if let casting = viewModel.casts[media.id] {
                                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(media, casts: casting, kind: .movie))) {
                                        MediaView(media: media, casts: casting, kind: .movie, viewModel: MediaViewModel())
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
            }
            .navigationTitle(chosen == 0 ? "Daily TV Trends" : "Daily Movie Trends")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $chosen) {
                        Text(Medias.tv.rawValue).tag(0)
                        Text(Medias.movie.rawValue).tag(1)
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
