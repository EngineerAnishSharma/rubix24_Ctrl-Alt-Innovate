import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class Loc {
  late Map<String, Map<String, String>> _localizedValues;
  late String _currentLocale;
  late List<String> _locales;

  static Loc? _instance;
  Loc._internal();

  static Loc get get {
    if (_instance == null) {
      _instance = Loc._internal();
    }
    return _instance!;
  }

  Future<void> initialize({String locale = "en"}) async {
    _localizedValues = await _loadTranslations();
    _currentLocale = locale; // Default locale, you can change it as needed
    _locales = [];
  }

  Future<Map<String, Map<String, String>>> _loadTranslations() async {
    String csvString = await rootBundle.loadString('assets/translations.csv');
    List<List<dynamic>> csvTable =
    const CsvToListConverter().convert(csvString);

    _locales =
    List<String>.from(csvTable[0].skip(1).map((dynamic e) => e.toString()));

    Map<String, Map<String, String>> translations = {};

    for (int i = 1; i < csvTable.length; i++) {
      if (csvTable[i].isEmpty) {
        continue; // Skip empty rows
      }

      String key = csvTable[i][0].toString();

      for (int j = 1; j < csvTable[i].length; j++) {
        if (j - 1 < _locales.length) {
          String locale = _locales[j - 1].trim();
          String value = csvTable[i][j].toString().trim();

          if (!translations.containsKey(key)) {
            translations[key] = {};
          }

          translations[key]![locale] = value;
        }
      }
    }

    return translations;
  }

  String operator [](String key) {
    if (_localizedValues.containsKey(key) &&
        _localizedValues[key]!.containsKey(_currentLocale.trim())) {
      return _localizedValues[key]![_currentLocale.trim()]!;
    }
    return key;
  }

  void changeLocale(String newLocale) {
    _currentLocale = newLocale.trim();
  }
}