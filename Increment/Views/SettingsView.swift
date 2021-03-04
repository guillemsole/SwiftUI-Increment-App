//
//  SettingsView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 4/3/21.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    var body: some View {
        List(viewModel.itemViewModels.indices, id:\.self) { index in
            Button {
                viewModel.tappedItem(at: index)
            } label: {
                HStack {
                    Image(systemName: viewModel.item(at: index).iconName)
                    Text(viewModel.item(at: index).title)
                }
            }
        }
        .navigationBarTitle(viewModel.title)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

