part of 'services_bloc.dart';

sealed class ServicesEvent  {
  const ServicesEvent();
}

 class ChooseAttach extends ServicesEvent{
   XFile? attach;
  ChooseAttach({required this.attach});
 }

 class AddBreadRequeset extends ServicesEvent{
  final String date;
  final String time;
  final String numberOfBread;

  const AddBreadRequeset({required this.date, required this.time, required this.numberOfBread});
}

class ChangeBottomSheet extends ServicesEvent{
  final bool isShow;
  const ChangeBottomSheet({required this.isShow}); 
}


class ChooseRoom extends ServicesEvent{
  final RoomEntities roomEntities;
  ChooseRoom({required this.roomEntities});
}

class SelectRoom extends ServicesEvent {
  final RoomEntities roomEntities;
  SelectRoom({required this.roomEntities});
}

class GetUniversities extends ServicesEvent{}


class GetUnities extends ServicesEvent{
  final String university;
  GetUnities({required this.university});
}

class GetRooms extends ServicesEvent{
  final String university;
  final String unit;
  GetRooms({required this.unit, required this.university});
}