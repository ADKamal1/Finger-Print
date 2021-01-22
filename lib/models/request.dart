class Request {
  Request({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.model,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  Model model;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
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
    this.serialMobile,
    this.message,
    this.type,
    this.id,
  });

  int employeeId;
  String serialMobile;
  String message;
  String type;
  int id;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        employeeId: json["employee_id"],
        serialMobile: json["serial_mobile"],
        message: json["message"],
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "serial_mobile": serialMobile,
        "message": message,
        "type": type,
        "id": id,
      };
}
