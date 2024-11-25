//
//  SwiftUIView.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 19/11/24.
//

import SwiftUI

struct LoginPasswordView: View{
    @State private var email = ""
    @State private var contrasena = ""
    var body: some View {
        
        VStack(alignment:.center,spacing: 50){
            VStack(alignment: .leading,spacing: 30){
                
            //TU CUENTA LABEL AND TEXTFIELD
                VStack(alignment: .leading, spacing: 15){
                    Text("Tu cuenta")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold))
                    
                    TextField("Inserta tu cuenta", text: $email)
                        .padding(16)
                        .keyboardType(.emailAddress)
                        .font(.system(size: 21, weight: .regular))
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                }
                
            //CONTRASEÑA AND TEXTFIELD
                VStack(alignment: .leading, spacing: 10){
                    Text("Tu contraseña")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold))
                    
                    SecureField("Inserta tu contraseña", text: $contrasena)
                        .padding(16)
                        .keyboardType(.emailAddress)
                        .font(.system(size: 21, weight: .regular))
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 3)
                        )
                }
            } .padding(.horizontal,25)
            
        //BOTON INICIAR SESION
            VStack(alignment: .center, spacing: 20){
                Button(action: {/*ACCION*/}) {
                    Text("Iniciar Sesión")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        .padding(15)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal,50)
                }
                Button(action: {/*ACCION*/}) {
                    Text("Crear una cuenta")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        .padding(15)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .padding(.horizontal,50)
                }
            }
        }
    }
}

#Preview {
    LoginPasswordView()
}
