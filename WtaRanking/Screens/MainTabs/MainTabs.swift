//
//  MainTabs.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import SwiftUI

struct MainTabs: View {
    @ObservedObject private var viewModel: MainTabVM
    var body: some View {
        TabView {
            viewModel.router.showHomeTabView()
                .tabItem {
                    Label(title: {
                        Text(L10n.homeTab)
                    }, icon: {
                        Image(systemName: Constants.homeTabIcon)
                    })
                }

            viewModel.router.showAboutTabView()
                .tabItem {
                    Label(title: {
                        Text(L10n.aboutTab)
                    }, icon: {
                        Image(systemName: Constants.aboutTabIcon)
                    })
                }
        }
    }

    init() {
        viewModel = DI.shared.mainTabVM
    }
}

struct MainTabs_Previews: PreviewProvider {
    static var previews: some View {
        MainTabs()
    }
}
