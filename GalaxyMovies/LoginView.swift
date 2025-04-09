//
//  ContentView.swift
//  GalaxyMovies
//
//  Created by Vitor Henrique Barreiro Marinho on 09/04/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isSecure: Bool = true
//
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()

            TextField("E-mail", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

            ZStack(alignment: .trailing) {
                if isSecure {
                    SecureField("Senha", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                } else {
                    TextField("Senha", text: $viewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }

                Button(action: {
                    isSecure.toggle()
                }) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .padding()
                }
            }

            Button(action: {
                viewModel.login()
            }) {
                Text("Entrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isLoginEnabled ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!viewModel.isLoginEnabled) // Desabilita o botão se as credenciais não forem válidas

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
