class Status {
  Status({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.model,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  Model model;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
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
    this.employeeId,
    this.status,
    this.serialMobile,
  });

  int employeeId;
  String status;
  String serialMobile;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        employeeId: json["employee_id"],
        status: json["status"],
        serialMobile: json["serial_mobile"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "status": status,
        "serial_mobile": serialMobile,
      };
}
