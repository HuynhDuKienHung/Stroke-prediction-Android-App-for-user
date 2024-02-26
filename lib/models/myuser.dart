class GetUser {
  final String? uid;

  GetUser({this.uid});
}

class UserData {
  final String? uid;
  final dynamic full_name;
  final dynamic age;
  final dynamic gender;
  final dynamic hypertension;
  final dynamic heart_disease;
  final dynamic marrital_status;
  final dynamic work_type;
  final dynamic residence;
  final dynamic avg_glucose_level;
  final dynamic bmi;
  final dynamic smoking_status;
  UserData(
      {this.uid,
      this.full_name,
      this.age,
      this.gender,
      this.hypertension,
      this.heart_disease,
      this.marrital_status,
      this.work_type,
      this.residence,
      this.avg_glucose_level,
      this.bmi,
      this.smoking_status});
}
