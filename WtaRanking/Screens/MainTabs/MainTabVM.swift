//
//  MainTabVM.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import Foundation

/// MainTab ViewModel
class MainTabVM: ObservableObject {
    let router: Router

    init(router: Router) {
        self.router = router
    }
}
