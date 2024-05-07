
import 'package:dio/dio.dart';
import '../../../../../core/network/remote/dio_helper.dart';
import '../../../../../core/resource/dart_state.dart';
import '../../models/user.dart';

abstract class UserApiService {
  DataState login({required String number, required String password});
  DataState register({required UserModel userModel});
  getUnivercities();
  getUnits({required String univercityName});
  getRoomsNumber({required String unitNumber,required String univercityName});
}

class UserApiServiceWitDio implements UserApiService {
  @override
  login({required String number, required String password}) async {
    final response = await DioHelper.postData(
        url: 'login/', data: {"password": password, "phone": number});
    return chekResponse(response: response);
  }

  @override
  register({required UserModel userModel}) async {
    final response = await DioHelper.postData(
        url: 'register/', data: userModel.toMap(userModel));
    return chekResponse(response: response);
  }

  @override
  getUnivercities() async {
    final response = await DioHelper.getData(url: 'univercities/',);
    return chekResponse(response: response);
  }
   @override
  getUnits({required String univercityName}) async{
    final response = await DioHelper.getData(url: '$univercityName/units',);
    return chekResponse(response: response);
  }
  @override
  getRoomsNumber({required String unitNumber, required String univercityName}) async{
    final response = await DioHelper.getData(url: '$univercityName/$unitNumber',);
    return chekResponse(response: response);
  }
  
 



 

}

DataState chekResponse({required Response response, int statusCode = 200}) {
  if (response.statusCode == statusCode) {
    return DataSuccess(response.data);
  } else {
    return DataFailed(DioException(
        error: response.statusMessage,
        response: response,
        requestOptions: response.requestOptions));
  }
}
