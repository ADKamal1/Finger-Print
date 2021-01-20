


class CheckOut {
  CheckOut({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.checkOutData,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  CheckOutData checkOutData;

  factory CheckOut.fromJson(Map<String, dynamic> json) => CheckOut(
    isSubmitted: json["isSubmitted"] == null ? null : json["isSubmitted"],
    isSubmittedSuccessfully: json["isSubmittedSuccessfully"] == null ? null : json["isSubmittedSuccessfully"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    checkOutData: json["model"] == null ? null : CheckOutData.fromJson(json["model"]),
  );

  Map<String, dynamic> toJson() => {
    "isSubmitted": isSubmitted == null ? null : isSubmitted,
    "isSubmittedSuccessfully": isSubmittedSuccessfully == null ? null : isSubmittedSuccessfully,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
    "model": checkOutData == null ? null : checkOutData.toJson(),
  };
}

class CheckOutData {
  CheckOutData({
    this.id,
    this.employeeId,
    this.checkOut,
    this.serialMobile,
    this.latout,
    this.lonout,
  });

  bool id;
  int employeeId;
  DateTime checkOut;
  String serialMobile;
  String latout;
  String lonout;

  factory CheckOutData.fromJson(Map<String, dynamic> json) => CheckOutData(
    id: json["id"] == null ? null : json["id"],
    employeeId: json["employee_id"] == null ? null : json["employee_id"],
    checkOut: json["check_out"] == null ? null : DateTime.parse(json["check_out"]),
    serialMobile: json["serial_mobile"] == null ? null : json["serial_mobile"],
    latout: json["latout"] == null ? null : json["latout"],
    lonout: json["lonout"] == null ? null : json["lonout"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "employee_id": employeeId == null ? null : employeeId,
    "check_out": checkOut == null ? null : checkOut.toIso8601String(),
    "serial_mobile": serialMobile == null ? null : serialMobile,
    "latout": latout == null ? null : latout,
    "lonout": lonout == null ? null : lonout,
  };
}
