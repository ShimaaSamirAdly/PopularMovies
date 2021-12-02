//
//  MovieDetailsView.swift
//  PopularMovies
//
//  Created by Shimaa on 12/1/21.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movieDetailsViewModel: MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Image(uiImage: UIImage(data: movieDetailsViewModel.getMovieImg()) ?? UIImage())
                    .resizable()
                    .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    
                    Text(movieDetailsViewModel.getMovieTitle())
                        .setUpTextStyle(fontSize: 20, fontWeight: .bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        
                    Text("Overview")
                        .setUpTextStyle(fontSize: 16, fontWeight: .bold)
                        
                    Text(movieDetailsViewModel.getMovieOverView())
                        .setUpTextStyle()
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
            }
        }
        .navigationBarTitle(movieDetailsViewModel.getMovieTitle(), displayMode: .inline)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieDetailsViewModel: MovieDetailsViewModel(movie: nil))
    }
}
