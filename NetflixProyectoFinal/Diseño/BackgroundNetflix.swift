//
//  SwiftUIView.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 19/11/24.
//

import SwiftUI

struct BackgroundNetflix: View {
    var body: some View {
        ZStack{
            Image("FondoNetflix")
                .resizable()
            
            Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.5), .red.opacity(0.6),]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: .infinity, height: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundNetflix()
}
