import 'dart:io';

import '../../../../core/constant/constant.dart';
import '../../../../core/resource/dart_state.dart';
import '../data_sources/remote/student_api_service.dart';
import '../../domain/repository/studnet_respository.dart';

class StudentRepositoryImpl implements  StudnetRepository{
  final StudentApiService _studentApiService;
  StudentRepositoryImpl(this._studentApiService);

  @override
  getRooms({required String university, required String unitName}) async{
   final response = await _studentApiService.getRooms(university: university, unitName: unitName);
   return checkResponse(response: response);
  }
  @override
  getUnities({required String university}) async{
 final response = await _studentApiService.getUnits(university: university);
 return checkResponse(response: response);
  }

  @override
  getUnversities() async{
    final  DataState response = await _studentApiService.getUnversities();
   return checkResponse(response: response);
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
  if(response is DataSuccess ){
      return response ;
    }else{
      print('errorMesss is :  ' );
      print(errorMessage);
      return errorMessage;
      
    }
}