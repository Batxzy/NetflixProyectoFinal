//
//  TapBarSuperior.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 19/11/24.
//

import SwiftUI

struct TapBarSuperior: View {
    var body: some View {
        NavigationView {
                    Text("Contenido Principal")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    print("Botón izquierdo presionado")
                                }) {
                                    Text("Buscar")
                                        Label("Buscar", systemImage: "magnifyingglass")
                                }
                            }
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    print("Botón derecho presionado")
                                }) {
                                    Label("Perfil", systemImage: "person.fill")
                                }
                            }
                        }
                }
    }
}

#Preview {
    TapBarSuperior()
}
