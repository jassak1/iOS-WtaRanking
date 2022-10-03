//
//  HomeTabVM.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import SwiftUI
import CloudKit

/// HomeTab ViewModel
class HomeTabVM: ObservableObject {
    @Published var ranking: [Ranking]
    @Published var errorMessage: String
    @Published var loadingContent: Bool
    @Published var rotationEffect: Double
    let ckService: CkService

    func fetchData() async throws -> [Ranking] {
        let ckRecord = CKRecord(recordType: Constants.recordName)
        let records = try await ckService.queryDatabase(for: ckRecord, sort: Constants.sortField)

        let ranking = records.map { record -> Ranking in
            let name = record[Constants.nameField] as? String ?? String()
            let country = record[Constants.countryField] as? String ?? String()
            let points = record[Constants.pointsField] as? Int ?? Int()
            let position = record[Constants.positionField] as? Int ?? Int()

            return Ranking(name: name,
                           country: country,
                           pts: points,
                           position: position)
        }

        return ranking
    }

    @MainActor
    func provideRaning() {
        loadingContent = true
        withAnimation {
            rotationEffect += 360
        }
        Task {
            do {
                ranking = try await fetchData()
            } catch {
                errorMessage = error.localizedDescription
            }
            loadingContent = false
        }
    }

    init(ckService: CkService) {
        self.ckService = ckService
        ranking = [Ranking()]
        errorMessage = String()
        loadingContent = true
        rotationEffect = 0
    }
}
