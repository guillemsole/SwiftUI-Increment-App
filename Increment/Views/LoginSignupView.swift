//
//  LoginSignupView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import SwiftUI

struct LoginSignupView: View {
    @ObservedObject var viewModel: LoginSignupViewModel
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
        }.padding()
    }
    
    var emailTextField: some View {
        TextField("Email", text: $viewModel.emailText).modifier(TextFieldCustomRoundedStyle())

    }
    
    var passwordTextField: some View {
        SecureField("Password", text: $viewModel.passwordText).modifier(TextFieldCustomRoundedStyle())
    }

    var actionButton: some View {
        Button(viewModel.buttonTitle) {
            // action
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color(.systemPink))
        .cornerRadius(16)
        .padding()
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginSignupView(viewModel: .init(mode: .login))
        }
    }
}