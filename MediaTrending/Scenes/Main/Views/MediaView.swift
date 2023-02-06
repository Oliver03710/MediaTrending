//
//  MediaView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/06.
//

import SwiftUI

struct MediaView: View {
    
    private let intro: LocalizedStringKey = "intro"
    private let items = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(0..<10, id: \.self) { i in
                    Text(intro)
                    Text("\(i)")
                }
                .padding()
                .background(Color.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
            .environment(\.locale, .init(identifier: "ko"))
    }
}
