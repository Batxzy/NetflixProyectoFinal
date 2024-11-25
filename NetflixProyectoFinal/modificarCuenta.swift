//
//  modificarCuenta.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 22/11/24.
//

import SwiftUI

struct CuentaModificar: View {
    @State private var nuevaContraseña = ""
    @State private var confirmacionContraseña = ""
    @State private var isPasswordValid = true
    @State private var showAlert = false
    @EnvironmentObject var userData: UserData // Para acceder a los datos del usuario
    @Environment(\.presentationMode) var presentationMode // Para regresar a la pantalla anterior
    @Binding var isLoggedIn: Bool // Enlace al estado de login del padre
    
    var currentUserEmail: String // Correo electrónico del usuario actual
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Mi cuenta")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,40)
                    .padding(.bottom,90)
                
                Text("Modificar Contraseña")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                VStack(alignment: .leading, spacing: 15) {
                    // Nueva Contraseña
                    SecureField("Nueva Contraseña", text: $nuevaContraseña)
                        .padding(16)
                        .font(.system(size: 21, weight: .regular))
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(10)
                    
                    // Confirmar Contraseña
                    SecureField("Confirmar Contraseña", text: $confirmacionContraseña)
                        .padding(16)
                        .font(.system(size: 21, weight: .regular))
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(10)
                    
                    if !isPasswordValid {
                        Text("Las contraseñas no coinciden")
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, 5)
                    }
                }
                .padding()
                
                // Botón para modificar la contraseña
                Button(action: {
                    if nuevaContraseña == confirmacionContraseña && !nuevaContraseña.isEmpty {
                        // Actualizar la contraseña del usuario
                        userData.updatePassword(forEmail: currentUserEmail, newPassword: nuevaContraseña)
                        showAlert = true
                    } else {
                        isPasswordValid = false
                    }
                }) {
                    Text("Modificar Contraseña")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Contraseña Modificada"), message: Text("Tu contraseña ha sido cambiada exitosamente."), dismissButton: .default(Text("OK"), action: {
                        // Cambiar el estado de login a false
                        isLoggedIn = false
                        presentationMode.wrappedValue.dismiss()
                    }))
                }
                
                Spacer()
                
                // Botón para salir de la cuenta y regresar al login
                Button(action: {
                    isLoggedIn = false // Salir de la cuenta
                    presentationMode.wrappedValue.dismiss() // Regresar al login
                }) {
                    Text("Salir de la Cuenta")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                }
                .padding(.bottom)
            }
            .navigationBarBackButtonHidden(true) // Ocultar el botón de volver por defecto
        }
    }
}

#Preview {
    @State var isLoggedIn = true // Usamos @State para isLoggedIn
    CuentaModificar(isLoggedIn: $isLoggedIn, currentUserEmail: "usuario@dominio.com")
        .environmentObject(UserData()) // Asegúrate de que el objeto `UserData` esté disponible en el entorno
}

