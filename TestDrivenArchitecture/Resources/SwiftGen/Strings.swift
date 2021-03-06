// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Verison %@ Build %@
  internal static func appVersion(_ p1: String, _ p2: String) -> String {
    return L10n.tr("Localizable", "app_version", p1, p2)
  }
  /// Email or password cannot be empty.
  internal static let emailOrPasswordCannotBeEmpty = L10n.tr("Localizable", "email_or_password_cannot_be_empty")
  /// Email or password is incorrect.
  internal static let emailOrPasswordIsIncorrect = L10n.tr("Localizable", "email_or_password_is_incorrect")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
