import 'package:flutter/material.dart';
import '../widgets/general.dart';

abstract class GeneralBlocState<T> with ChangeNotifier {
  T data;
  String error;
  bool hasData, hasError, waiting;

  GeneralBlocState
      ({
    this.data,
      this.error,
      this.hasData = false,
      this.hasError = false,
      this.waiting = true
  });

  @override
  String toString() {
    return "{data: $data, error: $error, hasData: $hasData,hasError: $hasError, isWaiting: $waiting}";
  }

  setError(String err) {
    error = err;
  }

  setWaiting() {
    waiting = true;
    hasData = false;
    notifyListeners();
  }

  dismissWatingWithError() {
    waiting = false;
    hasData = false;
    notifyListeners();
  }

  dismissWaiting() {
    waiting = false;
    hasData = true;
    notifyListeners();
  }

  showErrors({errors, BuildContext context}) {
    Widget err = Column(
      children: errors.map<Widget>((err) {
        return Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: General.buildTxt(
              txt: err, fontSize: 13.0, lineHeight: 1.5, color: Colors.black),
        );
      }).toList(),
    );
    General.showDialogue(txtWidget: err, context: context);
  }
}
