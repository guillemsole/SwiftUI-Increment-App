//
//  DropdownView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct DropdownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.headerTitle)
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 10)
            Button(action: {
                viewModel.isSelected = true
            }) {
                HStack {
                    Text(viewModel.dropdownTitle)
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24, weight: .medium))
                }
            }.buttonStyle(PrimaryButtonStyle(fillButton: .primaryButton))
        }.padding(15)
    }
}

//struct DropdownView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            DropdownView()
//        }
//        NavigationView {
//            DropdownView()
//        }.environment(\.colorScheme, .dark)
//    }
//}
