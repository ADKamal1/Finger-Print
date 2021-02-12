
import 'dart:convert';

GeneralInfo generalInfoFromJson(String str) => GeneralInfo.fromJson(json.decode(str));


class GeneralInfo {
  GeneralInfo({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.modelRules,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  ModelRules modelRules;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
    isSubmitted: json["isSubmitted"] == null ? null : json["isSubmitted"],
    isSubmittedSuccessfully: json["isSubmittedSuccessfully"] == null ? null : json["isSubmittedSuccessfully"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    modelRules: json["model"] == null ? null : ModelRules.fromJson(json["model"]),
  );


}

class ModelRules {
  ModelRules({
    this.employeeId,
    this.rules,
  });

  int employeeId;
  String rules;

  factory ModelRules.fromJson(Map<String, dynamic> json) => ModelRules(
    employeeId: json["employee_id"] == null ? null : json["employee_id"],
    rules: json["rules"] == null ? null : json["rules"],
  );

}
