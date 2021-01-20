
class User {
  User({
    this.isSubmitted,
    this.isSubmittedSuccessfully,
    this.errors,
    this.userData,
  });

  bool isSubmitted;
  bool isSubmittedSuccessfully;
  List<dynamic> errors;
  UserData userData;

  factory User.fromJson(Map<String, dynamic> json) => User(
    isSubmitted: json["isSubmitted"] == null ? null : json["isSubmitted"],
    isSubmittedSuccessfully: json["isSubmittedSuccessfully"] == null ? null : json["isSubmittedSuccessfully"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    userData: json["model"] == null ? null : UserData.fromJson(json["model"]),
  );

  Map<String, dynamic> toJson() => {
    "isSubmitted": isSubmitted == null ? null : isSubmitted,
    "isSubmittedSuccessfully": isSubmittedSuccessfully == null ? null : isSubmittedSuccessfully,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
    "model": userData == null ? null : userData.toJson(),
  };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.job,
    this.department,
    this.code,
    this.email,
    this.phone,
  });

  int id;
  String name;
  String job;
  String department;
  String code;
  String email;
  String phone;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    job: json["job"] == null ? null : json["job"],
    department: json["department"] == null ? null : json["department"],
    code: json["code"] == null ? null : json["code"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "job": job == null ? null : job,
    "department": department == null ? null : department,
    "code": code == null ? null : code,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}
