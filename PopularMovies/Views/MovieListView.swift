//
//  MovieListView.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import SwiftUI
import Combine

struct MovieListView: View {
   
    @ObservedObject var viewModel = MoviesListViewModel()
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    let width = geometry.size.width / 2.5
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: width))], spacing: 20) {
                        ForEach(0..<viewModel.getMoviesCount(), id: \.self) { index in
                            NavigationLink( destination: MovieDetailsView(movieDetailsViewModel: MovieDetailsViewModel(movie: viewModel.getMovieModel(index: index)))) {
                                VStack {
                                    Image(uiImage: UIImage(data: viewModel.getImgData(index: index) ?? Data()) ?? UIImage())
                                        .resizable()
                                        .cornerRadius(10)
                                    
                                    Text(viewModel.getTitle(index: index))
                                        .setUpTextStyle(fontWeight: .bold)
                                        .lineLimit(1)
                                        .padding()
                                    
                                }.frame(width: width, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .setBackGroundStyle()
                                .padding(5)
                            }
                        }
                    }
                }
            }.navigationTitle("Popular Movies")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
