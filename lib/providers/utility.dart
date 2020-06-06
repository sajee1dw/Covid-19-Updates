import 'package:covid_19/models/language.dart';
import 'package:flutter/cupertino.dart';

class UtilityProvider extends ChangeNotifier {
  Language _language = Language.English;

  set language(Language lan) {
    _language = lan;
    notifyListeners();
  }

  Language get language => _language;
}
