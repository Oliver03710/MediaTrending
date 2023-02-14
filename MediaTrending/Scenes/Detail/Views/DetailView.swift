//
//  DetailView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import SwiftUI

struct DetailView: View {
    
    var casts: [Cast]
    var crews: [Crew]
    
    @ObservedObject var viewModel = DetailViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(casts: Cast.getDummy(), crews: Crew.getDummy())
    }
}
