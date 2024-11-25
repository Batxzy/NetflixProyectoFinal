//
//  UserData.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 22/11/24.
//

import SwiftUI

//USER DATA
class UserData: ObservableObject {
    @Published var usuariosArrays: [[String: String]] = [
        ["email": "admin", "contrasena": "password123"],
        ["email": "user1", "contrasena": "pass1"],
        ["email": "user2", "contrasena": "pass2"],
        ["email": "melix.xd", "contrasena": "12345"],
    ]
    
    func updatePassword(forEmail email: String, newPassword: String) {
        if let index = usuariosArrays.firstIndex(where: { $0["email"] == email }) {
            usuariosArrays[index]["contrasena"] = newPassword
        }
    }
    
    func login (email: String, password: String) -> Bool {
        // Find user with matching email
        if let index = usuariosArrays.firstIndex(where: { $0["email"] == email }) {
            // Verify password
            return usuariosArrays[index]["contrasena"] == password
        }
        
        return false
    }
    
    
}
