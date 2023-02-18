//
//  DetailView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import SwiftUI

struct DetailView: View {
    
    @State var clicked = false
    @State var overviewHeight: CGFloat = 50
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        GeometryReader { geometry in
            List {
                Section() {
                    StretchableHeaderView(imagePath: "\(EndPoints.imageUrl)/\(viewModel.media.backdropPath)")
                }
                .listRowInsets(EdgeInsets())
                
                Section(header: Text("Overview")) {
                    VStack {
                        Text("\(viewModel.media.overview)")
                            .frame(height: clicked ? .infinity : 50)
                        
                        Button(action: {
                            clicked = clicked ? false : true
                        }) {
                            VStack {
                                Image(systemName: clicked ? "chevron.up" : "chevron.down")
                            }
                            .frame(width: 100, height: 40)
                            .foregroundColor(.black)
                        }
                    }
                }
                .textCase(nil)
                
                Section(header: Text("Casts")) {
                    ForEach(viewModel.casts, id: \.self) { item in
                        LazyVStack(alignment: .leading) {
                            DetailCellView(imagePath: item.profilePath,
                                           name: item.name,
                                           position: item.character)
                        }
                    }
                }
                .textCase(nil)
                
                Section(header: Text("Crews")) {
                    ForEach(viewModel.crews, id: \.self) { item in
                        LazyVStack(alignment: .leading) {
                            DetailCellView(imagePath: item.profilePath,
                                           name: item.name,
                                           position: item.knownForDepartment)
                        }
                    }
                }
                .textCase(nil)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .listStyle(.plain)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(3696814,
                                              media: Movie.getDummy(),
                                              casts: Cast.getDummy(),
                                              crews: Crew.getDummy()))
    }
}
