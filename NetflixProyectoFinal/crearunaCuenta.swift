//
//  crearunaCuenta.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 19/11/24.
//

import SwiftUI

struct crearunaCuenta: View {
    @EnvironmentObject var userData: UserData // Modelo compartido
    
    @State private var email: String = ""
    @State private var contrasena: String = ""
    @State private var confirmContrasena: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo de Netflix
                VStack {
                    Image("FondoNetflix")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.5), .red.opacity(0.6)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    ).ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("Crear una Cuenta")
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 30)
                        
                        // Campo de Email
                        VStack(alignment: .leading) {
                            Text("Tu correo")
                                .foregroundStyle(.white)
                                .font(.system(size: 21, weight: .bold))
                            TextField("Inserta tu correo", text: $email)
                                .padding(16)
                                .keyboardType(.emailAddress)
                                .font(.system(size: 18))
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 3)
                                )
                                .autocapitalization(.none)
                        }
                        .padding(.bottom, 20)
                        .padding(.horizontal, 50)
                        
                        // Campo de Contraseña
                        VStack(alignment: .leading) {
                            Text("Tu contraseña")
                                .foregroundStyle(.white)
                                .font(.system(size: 21, weight: .bold))
                            SecureField("Inserta tu contraseña", text: $contrasena)
                                .padding(16)
                                .font(.system(size: 18))
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 3)
                                )
                        }
                        .padding(.bottom, 21)
                        .padding(.horizontal, 50)
                        
                        // Confirmar Contraseña
                        VStack(alignment: .leading) {
                            Text("Confirmar contraseña")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            SecureField("Repite tu contraseña", text: $confirmContrasena)
                                .padding(16)
                                .font(.system(size: 18))
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 3)
                                )
                        }
                        .padding(.bottom, 30)
                        .padding(.horizontal, 50)
                    }
                    
                    // Botón de Crear Cuenta
                    Button(action: handleRegister) {
                        Text("Registrar")
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(.white)
                            .padding(15)
                            .frame(maxWidth: .infinity)
                            .background(email.isEmpty || contrasena.isEmpty || confirmContrasena.isEmpty ? Color.gray : Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 50)
                    .disabled(email.isEmpty || contrasena.isEmpty || confirmContrasena.isEmpty)
                    
                    Spacer()
                }
                .padding(.top, 100)
                .padding(.horizontal, 50)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alerta"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func handleRegister() {
        // Validar que las contraseñas coincidan
        guard contrasena == confirmContrasena else {
            alertMessage = "Las contraseñas no coinciden. Por favor, inténtalo de nuevo."
            showAlert = true
            return
        }
        
        // Validar si el email ya existe
        guard !userData.usuariosArrays.contains(where: { $0["email"] == email }) else {
            alertMessage = "Este correo ya está registrado. Intenta con otro."
            showAlert = true
            return
        }
        
        // Registrar el nuevo usuario
        let nuevoUsuario = ["email": email, "contrasena": contrasena]
        userData.usuariosArrays.append(nuevoUsuario)
        
        alertMessage = "¡Cuenta creada exitosamente!"
        showAlert = true
        clearFields()
    }
    
    private func clearFields() {
        email = ""
        contrasena = ""
        confirmContrasena = ""
    }
}

#Preview {
    crearunaCuenta()
        .environmentObject(UserData()) // Inicia el modelo compartido
}
