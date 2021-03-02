//
//  CreateView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    @State private var isActive = false
    
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropdownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text("Select"),
            buttons: viewModel.displayedOptions.indices.map { index in
                let option = viewModel.displayedOptions[index]
                return .default(Text("\(option.formatted)")){
                    viewModel.send(action: .selectOption(index: index))
                }
            })
    }
    
    var body: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                NavigationLink(destination: RemindView(), isActive: $isActive) {
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 24, weight: .medium))
                    }
                }
            }
            .actionSheet(isPresented: Binding<Bool>(get: {
                viewModel.hasSelectedDropdown
            }, set: {_ in })) {
                actionSheet
            }
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}
