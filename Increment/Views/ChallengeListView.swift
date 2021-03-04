//
//  ChallengeListView.swift
//  Increment
//
//  Created by Guillem Solé Cubilo on 3/3/21.
//

import SwiftUI

struct ChallengeListView: View {
    @StateObject private var viewModel = ChallengeListViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                VStack {
                    Text(error.localizedDescription)
                    Button("Retry") {
                        viewModel.send(action: .retry)
                    }
                    .padding()
                    .background(Rectangle().fill(Color.red).cornerRadius(5))
                }
            } else {
                mainContentView
            }
        }
    }
    
    var mainContentView: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible())], spacing: 20) {
                    ForEach(viewModel.itemViewModels, id: \.self) { viewModel in
                        ChallengeItemView(viewModel: viewModel)
                    }
                }
                Spacer()
            }.padding(10)
        }
        .sheet(isPresented: $viewModel.showingCreateModal) {
            NavigationView {
                CreateView()
            }.preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .navigationBarItems(trailing: Button {
            viewModel.send(action: .create)
        } label: {
            Image(systemName: "plus.circle").imageScale(.large)
        })
        .navigationBarTitle(viewModel.title)
    }
}

struct ChallengeItemView: View {
    private let viewModel: ChallengeItemViewModel
    
    init(viewModel: ChallengeItemViewModel) {
        self.viewModel = viewModel
    }
    
    var titleRow: some View {
        HStack {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .bold))
            Spacer()
            Image(systemName: "trash")
        }
    }
    
    var dailyIncreaseRow: some View {
        HStack {
            Text(viewModel.dailyIncreaseText)
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                titleRow
                Text(viewModel.statusText)
                    .font(.system(size: 12, weight: .bold))
                    .padding()
                dailyIncreaseRow
            }
            .padding(.vertical, 10)
            Spacer()
        }
        .background(
            Rectangle()
                .fill(Color.primaryButton)
                .cornerRadius(5)
        )
    }
    
}
