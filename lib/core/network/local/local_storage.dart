import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage
{
  static SharedPreferences? sharedPreferences ;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
 static putData({
    required String key,
    required dynamic value,
  }) async
  {
    if(value is bool) return await sharedPreferences!.setBool(key, value);
    if(value is String) return await sharedPreferences!.setString(key, value);
    if(value is int) return await sharedPreferences!.setInt(key, value);
    


  }

  static getData({
    required String key,
  })
  {
    try {
           return sharedPreferences!.get(key);

    } catch (e) {
      print(e.toString());
    }
  }

}