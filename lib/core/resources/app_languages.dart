///
///
/// the suborted language you must to add it here
/// and don't forget to add a new json file on translations

/// and add new lang to ios/Runner/Info.plist
/// <key>CFBundleLocalizations</key>
/// <array>
/// 	<string>en</string>
/// 	<string>nb</string>
/// </array>

enum LanguageType { ENGLISH }

const String ENGLISH = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}
