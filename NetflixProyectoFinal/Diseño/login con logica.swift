//
//  login con logica.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 21/11/24.
//

import SwiftUI

struct login_con_logica: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginAttempts: Int = 0
    @State private var isLocked: Bool = false
    @State private var lockTimeRemaining: Int = 0
    @State private var showErrorMessage: String?
    @State private var isLoggedIn: Bool = false
    @State private var timer: Timer?

    let users = [
        ["username": "admin", "password": "password123"],
        ["username": "user1", "password": "pass1"],
        ["username": "user2", "password": "pass2"]
    ]
    let maxAttempts = 3
    let lockoutDuration = 10 // Segundos para desbloquear

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Iniciar Sesión")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Campo para el usuario
                TextField("Usuario", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(isLocked)
                    .autocapitalization(.none)
                
                // Campo para la contraseña
                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(isLocked)
                
                // Botón de iniciar sesión
                if isLoggedIn {
                    NavigationLink(destination: Inicio_principal()) {
                        Text("Ir a la Home")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else {
                    Button(action: handleLogin) {
                        Text("Iniciar Sesión")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isLocked ? Color.gray : (username.isEmpty || password.isEmpty ? Color.gray : Color.blue))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(isLocked || username.isEmpty || password.isEmpty)
                }
                
                // Mensaje de error o bloqueo
                if let message = showErrorMessage {
                    Text(message)
                        .foregroundColor(isLocked ? .red : .orange)
                        .font(.footnote)
                }
                
                Spacer()
            }
            .padding()
        }
    }

    // Manejar el intento de inicio de sesión
    private func handleLogin() {
        if validateCredentials(username: username, password: password) {
            // Credenciales correctas
            isLoggedIn = true
            clearFields() // Limpiar los campos tras un inicio de sesión exitoso
        } else {
            // Credenciales incorrectas
            loginAttempts += 1
            showErrorMessage = "Usuario o contraseña incorrectos. Intentos restantes: \(maxAttempts - loginAttempts)"
            
            if loginAttempts >= maxAttempts {
                lockAccount()
            }
        }
    }

    // Validar credenciales usando el arreglo de usuarios
    private func validateCredentials(username: String, password: String) -> Bool {
        for user in users {
            if user["username"] == username && user["password"] == password {
                return true
            }
        }
        return false
    }

    // Bloquear la cuenta por exceder los intentos
    private func lockAccount() {
        isLocked = true
        lockTimeRemaining = lockoutDuration
        clearFields() // Restablecer los campos al bloquearse
        showErrorMessage = "Cuenta bloqueada. Intente nuevamente en \(lockTimeRemaining) segundos."
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            lockTimeRemaining -= 1
            if lockTimeRemaining > 0 {
                showErrorMessage = "Cuenta bloqueada. Intente nuevamente en \(lockTimeRemaining) segundos."
            } else {
                unlockAccount()
            }
        }
    }

    // Desbloquear la cuenta
    private func unlockAccount() {
        isLocked = false
        loginAttempts = 0
        showErrorMessage = nil
        timer?.invalidate()
        timer = nil
    }

    // Limpiar campos de texto
    private func clearFields() {
        username = ""
        password = ""
    }
}


#Preview {
    login_con_logica()
}
