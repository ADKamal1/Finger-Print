//employee_id
class GeneralInfo {
  GeneralInfo({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.model,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  Model model;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
        isSubmitted: json["isSubmitted"],
        isSubmittedSuccessfully: json["isSubmittedSuccessfully"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        model: Model.fromJson(json["model"]),
      );

  Map<String, dynamic> toJson() => {
        "isSubmitted": isSubmitted,
        "isSubmittedSuccessfully": isSubmittedSuccessfully,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "model": model.toJson(),
      };
}

class Model {
  Model({
    this.employee_id,
    this.rules,
  });

  int employee_id;
  String rules;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        employee_id: json["employee_id"],
        rules: json["rules"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employee_id,
        "rules": rules,
      };
}
