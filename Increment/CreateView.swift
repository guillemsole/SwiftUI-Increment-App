//
//  CreateView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 2/3/21.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    
    var dropdownList: some View {
//        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
//            DropdownView(viewModel: $viewModel.dropdowns[index])
//        }
        Group {
            DropdownView(viewModel: $viewModel.exerciseDropdown)
            DropdownView(viewModel: $viewModel.startAmountDropdown)
            DropdownView(viewModel: $viewModel.increaseDropdown)
            DropdownView(viewModel: $viewModel.lengthDropdown)
            
        }
    }
    
    var mainContentView: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                    Button(action: {
                        viewModel.send(action: .createChallenge)
                    }) {
                        Text("Create")
                            .font(.system(size: 24, weight: .medium))
                    }
            }
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                mainContentView
            }
        }
        .alert(isPresented: Binding<Bool>.constant($viewModel.error.wrappedValue != nil)) {
            Alert(title: Text("Error"), message: Text($viewModel.error.wrappedValue?.localizedDescription ?? ""), dismissButton: .default(Text("Ok"), action: {
                viewModel.error = nil
            }))
        }
        .navigationBarTitle("Create")
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 15)
    }
    
}
