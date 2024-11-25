//
//  Login.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 19/11/24.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var userData: UserData // Modelo compartido para usuarios
    
    @State private var email: String = ""
    @State private var contrasena: String = ""
    @State private var iscontrasenaVisible: Bool = false
    @State private var loginAttempts: Int = 0
    @State private var isLocked: Bool = false
    @State private var lockTimeRemaining: Int = 0
    @State private var showErrorMessage: String?
    @State private var isLoggedIn: Bool = false // Cambiar el estado del login aquí
    @State private var timer: Timer?
    
    @State private var showAlert: Bool = false // Para mostrar alertas
    @State private var alertMessage: String = "" // Mensaje de la alerta
    
    let maxAttempts = 3 // Máximo intentos
    let lockoutDuration = 10 // Segundos para desbloquear
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoggedIn {
                    OnlyButtonView() // Vista que se muestra cuando el usuario está logueado
                } else {
                    loginView() // Vista de inicio de sesión
                }
            }
            .preferredColorScheme(.dark)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alerta"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // Subvista: Formulario de inicio de sesión
    private func loginView() -> some View {
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
            
            ZStack {
                Image("logoNetflixpng")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }.padding(.bottom, 600)
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Tu cuenta")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold))
                        .padding(.bottom, 5)
                        .padding(.horizontal, 100)
                    
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
                        .padding(.bottom, 20)
                        .padding(.horizontal, 100)
                        .disabled(isLocked)
                        .autocapitalization(.none)
                    
                    Text("Tu contraseña")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold))
                        .padding(.bottom, 5)
                        .padding(.horizontal, 100)
                    
                    HStack {
                        if iscontrasenaVisible {
                            TextField("Inserta tu Contraseña", text: $contrasena)
                                .disabled(isLocked)
                        } else {
                            SecureField("Inserta tu Contraseña", text: $contrasena)
                                .disabled(isLocked)
                        }
                        
                        Button(action: {
                            iscontrasenaVisible.toggle()
                        }) {
                            Image(systemName: iscontrasenaVisible ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(16)
                    .font(.system(size: 21, weight: .regular))
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 3)
                    )
                    .padding(.bottom, 50)
                    .padding(.horizontal, 100)
                }
                
                VStack(spacing: 15) {
                    Button(action: handleLogin) {
                        Text("Iniciar Sesión")
                            .font(.system(size: 21, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(.horizontal, 100)
                    }
                    .disabled(isLocked)
                    
                    NavigationLink(destination: CuentaModificar(isLoggedIn: $isLoggedIn, currentUserEmail: email)) {
                        Text("Modificar mi cuenta")
                            .foregroundStyle(.white)
                            .font(.system(size: 21, weight: .bold))
                    }
                }
            }
        }
    }
    
    // Lógica para manejar el inicio de sesión
    private func handleLogin() {
        if userData.login(email: email, password: contrasena) {
            isLoggedIn = true
        } else {
            loginAttempts += 1
            if loginAttempts >= maxAttempts {
                isLocked = true
                lockTimeRemaining = lockoutDuration
                startLockoutTimer()
            }
        }
    }
    
    private func startLockoutTimer() {
        timer?.invalidate() // Invalidate previous timer if any
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if lockTimeRemaining > 0 {
                lockTimeRemaining -= 1
            } else {
                isLocked = false
                loginAttempts = 0
                timer?.invalidate()
            }
        }
    }
}


struct OnlyButtonView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: Inicio_principal()) { // Redirección al Inicio Principal
                Text("Ir al Inicio")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .ignoresSafeArea()
    }
}

#Preview {
    Login()
        .environmentObject(UserData()) // Integrar modelo compartido
}
