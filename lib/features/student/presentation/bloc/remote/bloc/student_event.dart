part of 'student_bloc.dart';

sealed class StudentEvent  {
  const StudentEvent();
}

 class ChooseAttach extends StudentEvent{
   String? attach;
  ChooseAttach({required this.attach});
 }

class ChangeBottomSheet extends StudentEvent{
  final bool isShow;
  const ChangeBottomSheet({required this.isShow}); 
}


class ChooseRoom extends StudentEvent{
  final RoomEntities roomEntities;
  ChooseRoom({required this.roomEntities});
}

class SelectRoom extends StudentEvent {
  final RoomEntities roomEntities;
  SelectRoom({required this.roomEntities});
}

class GetUniversities extends StudentEvent{}


class GetUnities extends StudentEvent{
  final String university;
  GetUnities({required this.university});
}

class GetRooms extends StudentEvent{
  final String university;
  final String unit;
  GetRooms({required this.unit, required this.university});
}

class SelectRegisterType extends StudentEvent{
  final String registerType;
  SelectRegisterType({required this.registerType});
}

class SubmitABreadOrder extends StudentEvent{
final String phone;
final int breadTies;
SubmitABreadOrder({required this.phone,required this.breadTies});
}