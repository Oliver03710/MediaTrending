//
//  MainView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import SwiftUI

struct MainView: View {
    
    private let intro: LocalizedStringKey = "intro"
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
