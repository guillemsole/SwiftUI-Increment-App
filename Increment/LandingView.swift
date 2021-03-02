//
//  LandingView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: proxy.size.height * 0.25)
                Text("Increment")
                    .font(.system(size: 64, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(
                Image("pullups")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            ).edgesIgnoringSafeArea(.all)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 8")
        LandingView().previewDevice("iPhone 11 Pro")
        LandingView().previewDevice("iPhone 11 Pro Max")
    }
}
