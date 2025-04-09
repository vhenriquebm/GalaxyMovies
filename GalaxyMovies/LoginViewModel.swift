//
//  LoginViewModel.swift
//  GalaxyMovies
//
//  Created by Vitor Henrique Barreiro Marinho on 09/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet {
            validate()
        }
    }
    
    @Published var password: String = "" {
        didSet {
            validate()
        }
    }
    
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isLoginEnabled: Bool = false
    
    private func validate() {
        isEmailValid = validateEmail(email)
        isPasswordValid = validatePassword(password)
        isLoginEnabled = isEmailValid && isPasswordValid
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let regex = #"^\S+@\S+\.\S+$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    func login() {
        if isLoginEnabled {
            print("Realizando login com \(email) / \(password)")
        } else {
            print("Credenciais inválidas.")
        }
    }
}

