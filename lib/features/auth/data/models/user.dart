import 'package:sakan/features/auth/domain/entities/user.dart';

class UserModel extends UserEntities {
  const UserModel({
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    int? phoneNumber,
    int? idNumber,
    int? idNationalNumber,
    String? univercity,
    String? faculty,
    String? section,
    String? campus,
    int? unitNumber,
    int? roomNumber,
    String? city,
    int? year,
    String? status,
    String? job,
    String? typeJob,
    String? token,
  });
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      fatherName: map['fatherName'] ?? "",
      motherName: map['motherName'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      idNumber: map['idNumber'] ?? "",
      idNationalNumber: map['idNationalNumber'] ?? "",
      univercity: map['univercity'] ?? "",
      faculty: map['faculty'] ?? "",
      section: map['section'] ?? "",
      campus: map['campus'] ?? "",
      unitNumber: map['unitNumber'] ?? "",
      roomNumber: map['roomNumber'] ?? "",
      city: map['city'] ?? "",
      year: map['year'] ?? "",
      status: map['status'] ?? "",
      job: map['job'] ?? "",
      typeJob: map['typeJob'] ?? "",
      token: map['token'] ?? "",
    );
  }
  toMap(UserModel userModel) {
    return {
      'firstName': userModel.firstName,
      'lastName': userModel.lastName,
      'fatherName': userModel.fatherName,
      'motherName': userModel.motherName,
      'phoneNumber': userModel.phoneNumber,
      'idNationalNumber': userModel.idNationalNumber,
      'idNumber': userModel.idNumber,
      'univercity': userModel.univercity,
      'faculty': userModel.faculty,
      'section': userModel.section,
      'campus': userModel.campus,
      'unitNumber': userModel.unitNumber,
      'roomNumber': userModel.roomNumber,
      'city': userModel.city,
      'year': userModel.year,
      'status': userModel.status,
      'job': userModel.job,
      'typeJob': userModel.typeJob,
      'token': userModel.token,
    };
  }
}
