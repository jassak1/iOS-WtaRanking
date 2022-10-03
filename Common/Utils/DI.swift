//
//  DI.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import Foundation

/// Dependency Injection
class DI {
    /// Singleton
    static let shared = DI()

    // MARK: - private properties
    private let router: Router
    private let ckService: CkService

    // MARK: - public properties
    public let mainTabVM: MainTabVM
    public let homeTabVM: HomeTabVM

    init() {
        router = Router()
        ckService = CkService()
        mainTabVM = MainTabVM(router: router)
        homeTabVM = HomeTabVM(ckService: ckService)
    }
}
