

import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? fatherName;
  final String? motherName;
  final int? phoneNumber;
  final int? idNumber;
  final int? idNationalNumber;
  final String? univercity;
  final String? faculty;
  final String? section;
  final String? campus;
  final int? unitNumber;
  final int? roomNumber;
  final String? city;
  final int? year;
  final String? status;
  final String? job;
  final String? typeJob;
  final String? token;

  const UserEntities(
      {
       this.firstName,
       this.lastName,
       this.fatherName,
       this.motherName,
       this.phoneNumber,
       this.idNumber,
       this.idNationalNumber,
       this.univercity,
       this.faculty,
       this.section,
       this.campus,
       this.unitNumber,
       this.roomNumber,
       this.city,
       this.year,
       this.status,
       this.job,
       this.typeJob,
       this.token});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        fatherName,
        motherName,
        phoneNumber,
        idNationalNumber,
        idNumber,
        univercity,
        faculty,
        section,
        campus,
        unitNumber,
        roomNumber,
        city,
        year,
        status,
        job,
        typeJob,
        token
      ];
}
