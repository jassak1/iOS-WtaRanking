// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Demo applicaition demonstrating fetching records from CloudKit.
  internal static let aboutBody = L10n.tr("Localizable", "aboutBody", fallback: "Demo applicaition demonstrating fetching records from CloudKit.")
  /// About WtaRanking
  internal static let aboutHeadline = L10n.tr("Localizable", "aboutHeadline", fallback: "About WtaRanking")
  /// About
  internal static let aboutTab = L10n.tr("Localizable", "aboutTab", fallback: "About")
  /// Top 5 WTA Players
  internal static let homeHeadline = L10n.tr("Localizable", "homeHeadline", fallback: "Top 5 WTA Players")
  /// Localizable.strings
  ///   WtaRanking
  /// 
  ///   Created by Adam Jassak on 16/09/2022.
  internal static let homeTab = L10n.tr("Localizable", "homeTab", fallback: "Home")
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
