//
//  GalaxyMoviesTests.swift
//  GalaxyMoviesTests
//
//  Created by Vitor Henrique Barreiro Marinho on 09/04/25.
//

import XCTest
@testable import GalaxyMovies // Substitua "SeuProjeto" pelo nome do seu projeto

final class LoginViewModelTests: XCTestCase {

    private var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Testes de Validação de E-mail

    func testEmailValidation_ValidEmail() {
        viewModel.email = "teste@exemplo.com"
        XCTAssertTrue(viewModel.isEmailValid, "O e-mail válido deveria ser considerado válido.")
    }

    func testEmailValidation_InvalidEmail_MissingAtSymbol() {
        viewModel.email = "testeexemplo.com"
        XCTAssertFalse(viewModel.isEmailValid, "O e-mail sem '@' não deveria ser considerado válido.")
    }

    func testEmailValidation_InvalidEmail_MissingDot() {
        viewModel.email = "teste@exemplo"
        XCTAssertFalse(viewModel.isEmailValid, "O e-mail sem '.' não deveria ser considerado válido.")
    }

    func testEmailValidation_EmptyEmail() {
        viewModel.email = ""
        XCTAssertFalse(viewModel.isEmailValid, "O e-mail vazio não deveria ser considerado válido.")
    }

    // MARK: - Testes de Validação de Senha

    func testPasswordValidation_ValidPassword() {
        viewModel.password = "123456"
        XCTAssertTrue(viewModel.isPasswordValid, "A senha com 6 ou mais caracteres deveria ser considerada válida.")
    }

    func testPasswordValidation_InvalidPassword_TooShort() {
        viewModel.password = "12345"
        XCTAssertFalse(viewModel.isPasswordValid, "A senha com menos de 6 caracteres não deveria ser considerada válida.")
    }

    func testPasswordValidation_EmptyPassword() {
        viewModel.password = ""
        XCTAssertFalse(viewModel.isPasswordValid, "A senha vazia não deveria ser considerada válida.")
    }

    // MARK: - Testes de Habilitação do Botão de Login

    func testLoginButtonEnabled_ValidCredentials() {
        viewModel.email = "teste@exemplo.com"
        viewModel.password = "123456"
        XCTAssertTrue(viewModel.isLoginEnabled, "O botão de login deveria estar habilitado com credenciais válidas.")
    }

    func testLoginButtonDisabled_InvalidEmail() {
        viewModel.email = "testeexemplo.com"
        viewModel.password = "123456"
        XCTAssertFalse(viewModel.isLoginEnabled, "O botão de login não deveria estar habilitado com um e-mail inválido.")
    }

    func testLoginButtonDisabled_InvalidPassword() {
        viewModel.email = "teste@exemplo.com"
        viewModel.password = "123"
        XCTAssertFalse(viewModel.isLoginEnabled, "O botão de login não deveria estar habilitado com uma senha inválida.")
    }

    func testLoginButtonDisabled_InvalidCredentials() {
        viewModel.email = "emailinvalido"
        viewModel.password = "123"
        XCTAssertFalse(viewModel.isLoginEnabled, "O botão de login não deveria estar habilitado com credenciais inválidas.")
    }
}

