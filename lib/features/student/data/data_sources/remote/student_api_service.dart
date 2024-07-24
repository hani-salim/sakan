import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sakan/core/network/remote/dio_helper.dart';
import 'package:sakan/core/resource/dart_state.dart';

abstract class StudentApiService{
    getUnversities();
  getUnits({required String university});
  getRooms({required String university, required String unitName});
  registerOnSakan(
      {required String email,
      required String unitversityName,
      required String unitNumber,
      required String roomNumber});
  logout({required String refreshToken});
  submitABreadOrder({required String phone, required int breadTies});
  submitAWorkPemit({required File attach,required String email});
  submitAMaintenanceRequest({required String unitversity,required String unit,required String room,required String description,required File attach});
  submitAComplaint({required String unitversityName,required String unitName});
}

class StudentApiServiceWithDio extends StudentApiService{
  @override
  getRooms({required String university, required String unitName}) async{
final response = await DioHelper.request(url: 'rooms/', method: 'POST');
   chekResponse(response: response);
  }

  @override
  getUnits({required String university}) async{
      final response = await DioHelper.request(url: 'unites/', method: 'POST');
   chekResponse(response: response);
  }

  @override
  getUnversities() async{
   final  response = await DioHelper.request(url: 'universities/', method: 'GET');
    chekResponse(response: response);
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

 DataState chekResponse({required  response, int statusCode = 200}) {
  if (response.statusCode == statusCode) {
    print('-----------------succsess-----------------------');
    print(response.data);
    return DataSuccess(response.data);
  } else {   
    print('-------------------failed-----------------------'); 
    return DataFailed(DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions));
  }
}