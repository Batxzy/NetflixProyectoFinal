//
//  NetflixProyectoFinalApp.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 14/11/24.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var userData = UserData()  // Creación de UserData
    
    var body: some Scene {
        WindowGroup {
            Login()  // Llamar la vista Login
                .environmentObject(userData)  // Pasar el objeto UserData a todas las vistas
        }
    }
}
