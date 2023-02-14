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
                    ForEach(viewModel.movies) { movie in
                        if let casting = viewModel.casts[movie.id] {
                            MediaView(movie: movie, casts: casting)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Daily Trend")
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
