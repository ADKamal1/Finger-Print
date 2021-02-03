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
      "Check Out": "Check Out",
      "Account": "Account",
      "FP": "FP",
      "Logout": "Logout",
      "LOGIN": "Login",
      "Next": "Next",
      "Check In": "Check In",
      "ivl": "In Valid Login",
      "Confirm Location": "Confirm Location",
      "Calender": "Calender",
      "Day": "Day",
      "Month": "Month",
      "Settings": "Settings",
      "des1": "Lorem lpsum is simply dummy",
      "des2": "Lorem lpsum is simply dummy",
      "Welcome": "Welcome to GTT",
      "des3": "Lorem lpsum is simply dummy",
      "Welcome back": "Welcome back",
      "sign": "Sign to continue",
      "EID": "Employee ID",
      "pass": "PassWord",
      "forg": "Forgot Password",
      "clf": "Confirm location first",
      "cif": "Check in first",
      "dep": "Department",
      "job": "Job Title",
      "gr": "General Rules & Information",
      "ri": "Requests & Inquiries",
      "s1": "Section I",
      "s2": "Section II",
      "s3": "Section III",
      "leave": "Leave Request",
      "loan": "Loan Request",
      "salary": "Salary Inquiry",
      "FAQ": "FAQ",
      "write": "Write your request here",
      "send": "Send",
      "UIAC": "user is already checked in",
      "CNC": "can not checkout without check in",
      "no event": " No Events",
      "CL": "Change Langauge",
      "LANGUAGE_HAS_CHANGED": "Language has changed",
    },
    'ar': {
      "CL": "تغيير اللغة",
      "CNC": "لا يمكن تسجيل الخروج قبل تسجيل الدخول",
      "UIAC": "تم تسجيل الدخول من قبل",
      "no event": "لا يوجد تسجيلات دخول وخروج",
      "leave": "طلب للمغادرة",
      "loan": "طلب قرض",
      "salary": "الاستعلام عن الراتب",
      "FAQ": "التعليمات",
      "write": "اكتب طلبك هنا",
      "send": "ارسال",
      "s1": "الفصل الاول",
      "s2": "الفصل الثانى",
      "s3": "الفصل الثالث",
      "dep": "القسم",
      "job": "المسمى الوظيفى",
      "gr": "المعلومات والقواعد العامة",
      "ri": "الطلابات والاستفسارات",
      "cif": "سجل دخولك اولا",
      "clf": "أكد موقعك اولا",
      "ivl": "تسجيل دخول خاطئ",
      "forg": "نسيت كلمة المرور",
      "pass": "كلمة المرور",
      "EID": "البريد الالكترونى",
      "sign": "سجل دخولك للاستمرار",
      "Welcome back": 'مرحبا بعودتك',
      "CONFIRM_LOCATION": "أكد موقعك لتأكيد دخولك وخروك ",
      "Day": " اليوم",
      "Month": " الشهر",
      "Settings": " الضبط",
      "FP": " البصمة",
      "Logout": " تسجيل الخروج",
      "LOGIN": " تسجيل الدخول",
      "Next": " التالى",
      "Check In": " الدخول",
      "Check Out": " الخروج",
      "Calender": "أوقاتى",
      "Account": " حسابى",
      "Confirm Location": " أكد موقعك",
      "Welcome": " مرحبا بكم فى تطبيق GTT",
      "des1": "حيث يمكنك ارسال مطالبك بكل سهولة",
      "des3": " تأكيد الدخول والخروج ",
      "des2": " تسجيل مواعيد العمل",
      "LANGUAGE_HAS_CHANGED": "تم تغيير اللغة",
    },
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
