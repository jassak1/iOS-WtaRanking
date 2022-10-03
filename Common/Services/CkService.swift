//
//  CkService.swift
//  WtaRanking
//
//  Created by Adam Jassak on 16/09/2022.
//

import Foundation
import CloudKit

/// Protocol providing blueprint for CkService
protocol CkServiceProto {
    /// Property of `CKDatabase` type defining CloudKit Database
    var database: CKDatabase { get }

    /// Method querying specific Record Type in CloudKit Database
    ///
    /// - Parameters:
    ///     - record: Value of `CKRecord` type describing specific CloudKit Record Type
    ///     - sort: Value of `String` type defining RecordType's sortable field
    /// - Returns: Array of `CKRecord`
    func queryDatabase(for record: CKRecord, sort: String) async throws -> [CKRecord]
}

/// CkService class responsible for fetching CloudKit database
class CkService: CkServiceProto {
    var database: CKDatabase {
        /// Initialize CKContainer with CloudKit Container identifier specified in iCloud Capability
        let db = CKContainer(identifier: Constants.container)
        return db.publicCloudDatabase
    }

    func queryDatabase(for record: CKRecord, sort: String) async throws -> [CKRecord] {
        let predicate = NSPredicate(value: true)
        let sortDescriptor = NSSortDescriptor(key: sort, ascending: true)
        let query = CKQuery(recordType: record.recordType, predicate: predicate)
        query.sortDescriptors = [sortDescriptor]

        return try await database.records(matching: query).matchResults.map { result -> CKRecord in
            try result.1.get()
        }
    }
}
