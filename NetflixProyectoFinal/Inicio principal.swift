//
//  Inicio principal.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

struct Inicio_principal: View {
    
    @State private var isLoggedIn: Bool = false // Agregamos el estado para controlar el login
   
   
    
var body: some View {
    NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    // Icono de cuenta en la parte superior derecha
                    HStack {
                        Spacer()
                        NavigationLink(destination: CuentaModificar(isLoggedIn: $isLoggedIn, currentUserEmail: "usuario@dominio.com")) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Sección: Top 10 de la semana
                            VStack(alignment: .leading) {
                                Text("Top 10 de la semana")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30, weight:.bold))
                                    .padding(.bottom, 5)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach([moviesTopUno, moviesTopDos, moviesTopTres, moviesTopCuatro, moviesTopCinco, moviesTopSeis, moviesTopSiete, moviesTopOcho, moviesTopNueve, moviesTopDiez], id: \.titulo) { item in
                                            NavigationLink(destination: MovieDetailView(movie: MoviesMovies(posterImageVertical: item.posterImageVertical, posterImageHorizontal: item.posterImageHorizontal, titulo: item.titulo, generos: item.generos, rating: item.rating, descripcion: item.descripcion, videoUrl: item.VideoURl))) {
                                                Image(item.posterImageVertical)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 220, height: 330)
                                                    .clipped()
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                                }
                                
                                // Sección: Series
                                VStack(alignment: .leading) {
                                    Text("Series")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 30, weight:.bold))
                                        .padding(.bottom, 5)
                                        .padding(.horizontal)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForEach([seriesUno, seriesDos, seriesTres, seriesCuatro, seriesCinco], id: \.titulo) { item in
                                                NavigationLink(destination: MovieDetailView(movie: MoviesMovies(posterImageVertical: item.posterImageVertical, posterImageHorizontal: item.posterImageHorizontal, titulo: item.titulo, generos: item.generos, rating: item.rating, descripcion: item.descripcion, videoUrl: item.VideoUrl))) {
                                                    Image(item.posterImageVertical)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 220, height: 320)
                                                        .clipped()
                                                        .cornerRadius(10)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.bottom, 20)
                                        
                                    }
                                }
                                // Sección: Movies
                                VStack(alignment: .leading) {
                                    Text("Peliculas")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 30, weight:.bold))
                                        .padding(.bottom, 5)
                                        .padding(.horizontal)
                                    
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 15) {
                                            ForEach([moviesUno, moviesDos, moviesTres, moviesCuatro, moviesCinco], id: \.titulo) { item in
                                                NavigationLink(destination: MovieDetailView(movie: item)) {
                                                    Image(item.posterImageVertical)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 220, height: 320)
                                                        .clipped()
                                                        .cornerRadius(10)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.bottom, 50)
                                    }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
    

#Preview {
    Inicio_principal()
}
