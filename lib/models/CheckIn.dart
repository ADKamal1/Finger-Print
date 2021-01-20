
class CheckIn {
  CheckIn({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.checkInData,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  CheckInData checkInData;

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
    isSubmitted: json["isSubmitted"] == null ? null : json["isSubmitted"],
    isSubmittedSuccessfully: json["isSubmittedSuccessfully"] == null ? null : json["isSubmittedSuccessfully"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    checkInData: json["model"] == null ? null : CheckInData.fromJson(json["model"]),
  );

  Map<String, dynamic> toJson() => {
    "isSubmitted": isSubmitted == null ? null : isSubmitted,
    "isSubmittedSuccessfully": isSubmittedSuccessfully == null ? null : isSubmittedSuccessfully,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
    "model": checkInData == null ? null : checkInData.toJson(),
  };
}

class CheckInData {
  CheckInData({
    this.employeeId,
    this.checkIn,
    this.serialMobile,
    this.latin,
    this.lonin,
    this.id,
  });

  int employeeId;
  DateTime checkIn;
  String serialMobile;
  String latin;
  String lonin;
  int id;

  factory CheckInData.fromJson(Map<String, dynamic> json) => CheckInData(
    employeeId: json["employee_id"] == null ? null : json["employee_id"],
    checkIn: json["check_in"] == null ? null : DateTime.parse(json["check_in"]),
    serialMobile: json["serial_mobile"] == null ? null : json["serial_mobile"],
    latin: json["latin"] == null ? null : json["latin"],
    lonin: json["lonin"] == null ? null : json["lonin"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "employee_id": employeeId == null ? null : employeeId,
    "check_in": checkIn == null ? null : checkIn.toIso8601String(),
    "serial_mobile": serialMobile == null ? null : serialMobile,
    "latin": latin == null ? null : latin,
    "lonin": lonin == null ? null : lonin,
    "id": id == null ? null : id,
  };
}
