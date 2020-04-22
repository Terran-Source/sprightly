/// Database enums
///
/// any changes here should be replicated manually in the
/// models/db/database.dart file
/// as moor can't handle dynamic string in `customConstraint`
///
/// otherwise, it'd be like
/// ```dart
/// customConstraint("${MemberIdType.values.getConstraints('idType')} NOT NULL")
/// ```
/// instead of
/// ```dart
/// customConstraint("CHECK (idType IN ('Phone', 'Email', 'NickName', 'Group')) NOT NULL")
/// ```
/// for `Members`.`idType`

enum MemberIdType { Phone, Email, NickName, Group, GroupMember }
enum GroupType { Personal, Budget, Shared }
enum AccountType { Group, Cash, Credit, Bank, Investment }
enum CategoryType { Expense, Liability, Income, Investment, Misc }

// package:sprightly/models
enum GroupActivityType {
  /// GroupActivity operations like: created/updated(like name etc.)/deleted
  GroupActivity,

  /// GroupAccountMember operations like: created/updated(like name etc.)/deleted
  Account,

  /// GroupOnlyMember operations like: created/updated(like name etc.)/deleted
  Member,

  /// GroupTransaction operations like: created/updated(like name etc.)/deleted
  Transaction,
}

// Setup DB
enum FontType { Regular, Mono }
enum FontStyle { Regular, Italic, Bold, BoldItalic }
enum ThemeMode { Bright, Dark }
