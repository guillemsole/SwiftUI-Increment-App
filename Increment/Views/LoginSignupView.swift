//
//  LoginSignupView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import SwiftUI

struct LoginSignupView: View {
    @StateObject var viewModel: LoginSignupViewModel
    @Binding var isPushed: Bool

    init(mode: LoginSignupViewModel.Mode, isPushed: Binding<Bool>) {
        self._isPushed = isPushed
        self._viewModel = .init(wrappedValue: .init(mode: mode))
    }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(viewModel.subtitle)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.systemGray2))
            Spacer().frame(height: 50)
            emailTextField
            passwordTextField
            actionButton
            Spacer()
        }
        .onReceive(viewModel.$isPushed) { isPushed in
            self.isPushed = isPushed
        }
        .padding()
    }
    
    var emailTextField: some View {
        TextField(viewModel.emailPlaceholderText, text: $viewModel.emailText).modifier(TextFieldCustomRoundedStyle())

    }
    
    var passwordTextField: some View {
        SecureField(viewModel.passwordPlaceholderText, text: $viewModel.passwordText).modifier(TextFieldCustomRoundedStyle())
    }

    var actionButton: some View {
        Button(viewModel.buttonTitle) {
            // action
            viewModel.tappedActionButton()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color(.systemPink))
        .cornerRadius(16)
        .padding()
        .disabled(!viewModel.isValid)
        .opacity(viewModel.isValid ? 1 : 0.5)
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginSignupView(mode: .login, isPushed: .constant(false))
        }
    }
}
