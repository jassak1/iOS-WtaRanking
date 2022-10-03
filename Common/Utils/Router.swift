//
//  Router.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import Foundation

/// Protocol providing blueprint for Router
protocol WtaRankingRouter {
    func showHomeTabView() -> HomeTabView
    func showAboutTabView() -> AboutTabView
}

/// Router class responsible for dispalying specific SwiftUI View
class Router: WtaRankingRouter {
    func showHomeTabView() -> HomeTabView {
        HomeTabView()
    }
    func showAboutTabView() -> AboutTabView {
        AboutTabView()
    }
}
