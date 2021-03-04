//
//  LandingView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    
    var title: some View {
        Text(viewModel.title)
            .font(.system(size: 64, weight: .medium))
            .foregroundColor(.white)
    }
    
    var createButton: some View {
        Button(action: {
            viewModel.createPush = true
        }) {
            HStack(spacing: 15.0) {
                Spacer()
                Image(systemName: viewModel.createButtonImageName)
                Text(viewModel.createButtonTitle)
                Spacer()
            }
            .font(.system(size: 24, weight: .semibold))
            .foregroundColor(.white)
        }
        .padding(15.0)
        .buttonStyle(PrimaryButtonStyle())
    }
    var alreadyButton: some View {
        Button(viewModel.alreadyButtonTitle) {
            viewModel.loginSignupPushed = true
        }.foregroundColor(.white)
    }
    
    var backgroundImage: some View {
        Image(viewModel.backgroundImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(Color.black.opacity(0.4))
    }

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.08)
                    title
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: $viewModel.createPush) {}
                    createButton
                    NavigationLink(
                        destination: LoginSignupView(viewModel: .init(mode: .login, isPushed: $viewModel.loginSignupPushed)),
                        isActive: $viewModel.loginSignupPushed) {}
                    alreadyButton
                }
                .padding(.bottom, 15)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    backgroundImage
                        .frame(width: proxy.size.width)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }.accentColor(.primary)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        // LandingView().previewDevice("iPhone 8")
        LandingView().previewDevice("iPhone 11 Pro")
        // LandingView().previewDevice("iPhone 11 Pro Max")
    }
}
