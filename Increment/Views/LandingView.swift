//
//  LandingView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.08)
                    Text("Increment")
                        .font(.system(size: 64, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: $viewModel.createPush) {
                        Button(action: {
                            viewModel.createPush = true
                        }) {
                            HStack(spacing: 15.0) {
                                Spacer()
                                Image(systemName: "plus.circle")
                                Text("Create a challenge")
                                Spacer()
                            }
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                        }
                        .padding(15.0)
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    Button("I already have an account") {
                        viewModel.loginSignupPushed = true
                    }.foregroundColor(.white)
                }
                .padding(.bottom, 15)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    Image("pullups")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Color.black.opacity(0.4))
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
