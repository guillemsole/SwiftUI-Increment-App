//
//  DropdownView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct DropdownView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Exercice")
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 10)
            Button(action: {}) {
                HStack {
                    Text("Push ups")
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24, weight: .medium))
                }
            }.buttonStyle(PrimaryButtonStyle(fillButton: .primaryButton))
        }.padding(15)
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DropdownView()
        }
        NavigationView {
            DropdownView()
        }.environment(\.colorScheme, .dark)
    }
}
