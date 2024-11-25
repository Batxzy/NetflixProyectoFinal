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
                                    ForEach(top10, id: \.id) { item in
                                        NavigationLink(destination: item.destinationView) {
                                            Image(item.imageName)
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
                                    ForEach(series, id: \.id) { item in
                                        NavigationLink(destination: item.destinationView) {
                                            Image(item.imageName)
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
                            
                            // Sección: Movies
                            VStack(alignment: .leading) {
                                Text("Peliculas")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 30, weight:.bold))
                                    .padding(.bottom, 5)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(movies, id: \.id) { item in
                                            NavigationLink(destination: item.destinationView) {
                                                Image(item.imageName)
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
                    .background(LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
    
    // Modelo para los elementos de las secciones
    struct Item: Identifiable {
        let id = UUID()
        let imageName: String
        let destinationView: AnyView
    }
    
    // Datos de prueba
    let top10 = [
        Item(imageName: "posterImageVertical1", destinationView: AnyView(Text("Pantalla de Arcane"))),
        Item(imageName: "posterImageVertical2", destinationView: AnyView(Text("Pantalla de Pedro Páramo"))),
        Item(imageName: "posterImageVertical3", destinationView: AnyView(Text("Pantalla de Aprender a Soltar"))),
    ]
    
    let series = [
        Item(imageName: "posterImageVertical1", destinationView: AnyView(Text("Pantalla de Cyberpunk"))),
        Item(imageName: "posterImageVertical2", destinationView: AnyView(Text("Pantalla de El Secreto")))
    ]
    
    let movies = [
        Item(imageName: "posterImageVertical1", destinationView: AnyView(Text("Pantalla de Cyberpunk"))),
        Item(imageName: "posterImageVertical2", destinationView: AnyView(Text("Pantalla de El Secreto")))
    ]
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Inicio_principal()
        }
    }
}

#Preview {
    Inicio_principal()
}
