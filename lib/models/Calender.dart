

class Calender {
  Calender({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.calenderData,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  List<CalenderData> calenderData;

  factory Calender.fromJson(Map<String, dynamic> json) => Calender(
    isSubmitted: json["isSubmitted"] == null ? null : json["isSubmitted"],
    isSubmittedSuccessfully: json["isSubmittedSuccessfully"] == null ? null : json["isSubmittedSuccessfully"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    calenderData: json["model"] == null ? null : List<CalenderData>.from(json["model"].map((x) => CalenderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSubmitted": isSubmitted == null ? null : isSubmitted,
    "isSubmittedSuccessfully": isSubmittedSuccessfully == null ? null : isSubmittedSuccessfully,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
    "model": calenderData == null ? null : List<dynamic>.from(calenderData.map((x) => x.toJson())),
  };
}

class CalenderData {
  CalenderData({
    this.id,
    this.name,
    this.checkIn,
    this.checkOut,
    this.code,
    this.email,
    this.serial,
    this.latinCheckIn,
    this.loninCheckIn,
    this.latinCheckOut,
    this.loninCheckOut,
  });

  int id;
  String name;
  DateTime checkIn;
  DateTime checkOut;
  String code;
  String email;
  String serial;
  String latinCheckIn;
  String loninCheckIn;
  String latinCheckOut;
  String loninCheckOut;

  factory CalenderData.fromJson(Map<String, dynamic> json) => CalenderData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    checkIn: json["check_in"] == null ? DateTime.now() : DateTime.parse(json["check_in"]),
    checkOut: json["check_out"] == null ? DateTime.now() : DateTime.parse(json["check_out"]),
    code: json["code"] == null ? null : json["code"],
    email: json["email"] == null ? null : json["email"],
    serial: json["serial"] == null ? null : json["serial"],
    latinCheckIn: json["latin_check_in"] == null ? null : json["latin_check_in"],
    loninCheckIn: json["lonin_check_in"] == null ? null : json["lonin_check_in"],
    latinCheckOut: json["latin_check_out"] == null ? null : json["latin_check_out"],
    loninCheckOut: json["lonin_check_out"] == null ? null : json["lonin_check_out"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "check_in": checkIn == null ? null : checkIn.toIso8601String(),
    "check_out": checkOut == null ? null : checkOut.toIso8601String(),
    "code": code == null ? null : code,
    "email": email == null ? null : email,
    "serial": serial == null ? null : serial,
    "latin_check_in": latinCheckIn == null ? null : latinCheckIn,
    "lonin_check_in": loninCheckIn == null ? null : loninCheckIn,
    "latin_check_out": latinCheckOut == null ? null : latinCheckOut,
    "lonin_check_out": loninCheckOut == null ? null : loninCheckOut,
  };
}
