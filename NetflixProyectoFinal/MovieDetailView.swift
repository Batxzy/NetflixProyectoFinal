//
//  MovieDetailView.swift
//  NetflixProyectoFinal
//
//  Created by lian on 25/11/24.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: MoviesMovies

    var body: some View {

        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.49, green: 0.01, blue: 0.01), location: 0.00),
                    Gradient.Stop(color: .black, location: 0.70),
                ],
                startPoint: UnitPoint(x: 0.57, y: 1),
                endPoint: UnitPoint(x: 0.57, y: 0.13)
            )
            .ignoresSafeArea()

            VStack(alignment: .center, spacing: 5) {
                ZStack {
                    Image(movie.posterImageHorizontal)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .clipped()
                        .padding(.bottom)

                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(maxWidth: .infinity, maxHeight: 250)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(movie.titulo)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)

                        Text(movie.descripcion)
                            .font(.callout)

                        Button(action: {
                            videoView()
                        }) {
                            Text("Watch")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal, 50)
                                .background(Color.red)
                                .cornerRadius(25)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Generos:")
                                .font(.system(size: 23, weight: .medium))
                                .foregroundStyle(.white)

                            VStack(alignment: .center, spacing: 10) {
                                ForEach(movie.generos, id: \.self) { genero in
                                    Text(genero)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .padding(9)
                                        .padding(.horizontal, 5)
                                        .background(.thinMaterial)
                                        .cornerRadius(16)
                                        .lineLimit(nil)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxHeight: .infinity, alignment: .topLeading)

                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
        }
        .preferredColorScheme(.dark)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}
#Preview {
    MovieDetailView(movie: moviesCuatro)
}
