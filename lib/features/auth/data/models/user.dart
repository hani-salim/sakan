import '../../domain/entities/user.dart';

class UserModel extends UserEntities {
  const UserModel(
      {super.firstName,
      super.lastName,
      super.motherName,
      super.fatherName,
      super.phoneNumber,
      super.idNationalNumber,
      super.university,
      super.faculty,
      super.section,
      super.unitNumber,
      super.roomNumber,
      super.city,
      super.year,
      super.status,
      super.job,
      super.token,
      super.img
      });
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        firstName: map['firstName'] ?? "",
        lastName: map['lastName'] ?? "",
        fatherName: map['fatherName'] ?? "",
        motherName: map['motherName'] ?? "",
        phoneNumber: map['phoneNumber'],
        idNationalNumber: map['idNationalNumber'],
        university: map['university'] ?? "",
        faculty: map['faculty'] ?? "",
        section: map['section'] ?? "",
        unitNumber: map['unitNumber'],
        roomNumber: map['roomNumber'],
        city: map['city'] ?? "",
        year: map['year'],
        status: map['status'] ?? "",
        job: map['job'] ?? "",
        token: map['access_token'] ?? "",
        img: map['img'] ?? "https://i.imgflip.com/3f2lx0.jpg");
  }
  toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'fatherName':fatherName,
      'motherName': motherName,
      'phoneNumber': phoneNumber,
      'idNationalNumber': idNationalNumber,
      'univercity': university,
      'faculty': faculty,
      'section': section,
      'unitNumber': unitNumber,
      'roomNumber': roomNumber,
      'city': city,
      'year': year,
      'status': status,
      'job': job,
      'typeJob': typeJob,
      'token': token,
      'img': img
    };
  }
}
