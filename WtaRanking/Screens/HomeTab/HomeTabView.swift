//
//  HomeTabView.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject private var viewModel: HomeTabVM
    var body: some View {
        NavigationView {
            VStack {
                bodyContent(isLoading: viewModel.loadingContent,
                            ranking: viewModel.ranking)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.provideRaning()
                    }, label: {
                        Image(systemName: Constants.reloadIcon)
                            .rotationEffect(.degrees(viewModel.rotationEffect))
                    })
                }
            }
            .navigationTitle(L10n.homeHeadline.uppercased())
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder func bodyContent(isLoading: Bool, ranking: [Ranking]) -> some View {
        if isLoading {
            ProgressView()
        } else {
            List {
                ForEach(viewModel.ranking) { rank in
                    HStack {
                        Image(rank.country)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(color: .gray, radius: 2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text(rank.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(rank.pts)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }.listStyle(.plain)
        }
    }

    init() {
        viewModel = DI.shared.homeTabVM
        viewModel.provideRaning()
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
