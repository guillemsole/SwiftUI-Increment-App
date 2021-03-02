//
//  RemindView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct RemindView: View {
    var body: some View {
        VStack {
            Spacer()
            //DropdownView()
            Spacer()
            Button(action: {}) {
                Text("Create")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
            }
            .padding(15)
            Button(action: {}) {
                Text("Skip")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
            }
        }
        .navigationBarTitle("Remind")
        .padding(.bottom, 15)
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RemindView()
        }
    }
}
