

import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? fatherName;
  final String? motherName;
  final int? phoneNumber;
  final int? idNationalNumber;
  final String? university;
  final String? faculty;
  final String? section;
  final String? unitNumber;
  final String? roomNumber;
  final String? city;
  final int? year;
  final String? status;
  final String? job;
  final String? typeJob;
  final String? token;
  final  String? img;

  const UserEntities(
      {
       this.firstName,
       this.lastName,
       this.fatherName,
       this.motherName,
       this.phoneNumber,
       this.idNationalNumber,
       this.university,
       this.faculty,
       this.section,
       this.unitNumber,
       this.roomNumber,
       this.city,
       this.year,
       this.status,
       this.job,
       this.typeJob,
       this.token,
       this.img});

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        fatherName,
        motherName,
        phoneNumber,
        idNationalNumber,

        university,
        faculty,
        section,
        unitNumber,
        roomNumber,
        city,
        job,
        year,
        status,
        typeJob,
        token,
        img
      ];
}
