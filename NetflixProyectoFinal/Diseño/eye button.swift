//
//  eye button.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI

//TextField con boton EYE
struct PasswordView: View {
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack {
            HStack {
                if isPasswordVisible {
                    TextField("Contraseña", text: $password)
                } else {
                    SecureField("Contraseña", text: $password)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
