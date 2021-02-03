import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class TranslationBase {
  TranslationBase(this.locale);

  final Locale locale;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      "CONFIRM_LOCATION":
          "Confirm your location to have to option to check in or out.",
    },
    'ar': {
      "CONFIRM_LOCATION": "أكد موقعك لتأكيد دخولك وخروك ",
    },
    'en': {
      "Confirm Location ": "Confirm Location",
    },
    'ar': {
      "Confirm Location": " أكد موقعك",
    },
    'en': {
      "Check Out": "Check Out",
    },
    'ar': {
      "Check Out": " الخروج",
    },
    'en': {
      "Check In": "Check In",
    },
    'ar': {
      "Check In": " الدخول",
    },
    'en': {
      "Next": "Next",
    },
    'ar': {
      "Next": " التالى",
    },
    'en': {
      "Login": "Login",
    },
    'ar': {
      "Login": " تسجيل الدخول",
    },
    'en': {
      "Logout": "Logout",
    },
    'ar': {
      "Logout": " تسجيل الخروج",
    },
    'en': {
      "FP": "FP",
    },
    'ar': {
      "FP": " البصمة",
    },
    'en': {
      "Account": "Account",
    },
    'ar': {
      "Account": " حسابى",
    },
    'en': {
      "Calender": "Calender",
    },
    'ar': {
      "Calender": "أوقاتى",
    },
    'en': {
      "Settings": "Settings",
    },
    'ar': {
      "Settings": " الضبط",
    },
    'en': {
      "Month": "Month",
    },
    'ar': {
      "Month": " الشهر",
    },
    'en': {
      "Day": "Day",
    },
    'ar': {
      "Day": " اليوم",
    },
    'en': {
      "Welcome": "Welcome to GTT",
    },
    'ar': {
      "Welcome": " مرحبا بكم فى تطبيق GTT",
    },
    'en': {
      "des1": "Lorem lpsum is simply dummy",
    },
    'ar': {
      "des1": "تلقى مطالبكم الوظيفي",
    },
    'en': {
      "des2": "Lorem lpsum is simply dummy",
    },
    'ar': {
      "des2": " تسجيل مواعيد العمل",
    },
    'en': {
      "des3": "Lorem lpsum is simply dummy",
    },
    'ar': {
      "des3": " تأكيد الدخول والخروج ",
    }
  };

  String getStringLocaledByKey(String key) {
    return _localizedValues[locale.languageCode][key];
  }
}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
