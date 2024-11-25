//
//  MovieDetailView.swift
//  NetflixProyectoFinal
//
//  Created by lian on 25/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.black, .red], startPoint: .top, endPoint:.bottom)
            
            VStack(alignment: .leading) {
                Image("CyberpunkHorizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                    .padding(.bottom)
                
                VStack{
                    Text("Titulo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Generes")
                    ForEach(series.generos, id: \.self) { genero in
                        Text(genero)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(16)
                        
                    }
                }
            }
        }
        .frame(maxHeight: .infinity,alignment: .topLeading)
        .ignoresSafeArea()
        
    }
}

#Preview {
    MovieDetailView()
}
