import 'dart:io';

abstract class StudnetRepository {
  getUnversities();
  getUnities({required String university});
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
