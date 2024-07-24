import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/resource/dart_state.dart';
import 'package:sakan/features/student/data/data_sources/remote/student_api_service.dart';
import 'package:sakan/features/student/domain/repository/studnet_respository.dart';

class StudentRepositoryImpl implements  StudnetRepository{
  final StudentApiService _studentApiService;
  StudentRepositoryImpl(this._studentApiService);

  @override
  getRooms({required String university, required String unitName}) async{
   final response = await _studentApiService.getRooms(university: university, unitName: unitName);
   checkResponse(response: response);
  }
  @override
  getUnities({required String university}) async{
 final response = await _studentApiService.getUnits(university: university);
 checkResponse(response: response);
  }

  @override
  getUnversities() async{
    final  response = await _studentApiService.getUnversities();
    checkResponse(response: response);
  }

  @override
  logout({required String refreshToken}) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  registerOnSakan({required String email, required String unitversityName, required String unitNumber, required String roomNumber}) {
    // TODO: implement registerOnSakan
    throw UnimplementedError();
  }

  @override
  submitABreadOrder({required String phone, required int breadTies}) {
    // TODO: implement submitABreadOrder
    throw UnimplementedError();
  }

  @override
  submitAComplaint({required String unitversityName, required String unitName}) {
    // TODO: implement submitAComplaint
    throw UnimplementedError();
  }

  @override
  submitAMaintenanceRequest({required String unitversity, required String unit, required String room, required String description, required File attach}) {
    // TODO: implement submitAMaintenanceRequest
    throw UnimplementedError();
  }

  @override
  submitAWorkPemit({required File attach, required String email}) {
    // TODO: implement submitAWorkPemit
    throw UnimplementedError();
  }

}

checkResponse({response}){
  if(response is DataSuccess && response.data.isNotEmpty){
      return DataSuccess(response.data) ;
    }else{
      return errorMessage;
    }
}