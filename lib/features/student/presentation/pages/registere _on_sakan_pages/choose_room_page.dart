import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sakan/core/widgets/drop_down_form_field_widget.dart.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/presentation/widgets/room_widget.dart';

// ignore: must_be_immutable
class ChooseRoomPage extends StatelessWidget {
  ChooseRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    String univercityName = '';
    String unitName = '';
    return
     Padding(
      padding: const EdgeInsets.all(8.0),
      child:  SingleChildScrollView(
        child: Column(
            children: [
              dropDownButtonFormFieldWidget(
                  items: ['ee', 'ww'],
                  selectedItem: univercityName,
                  labelText: 'الجامعة'),
              const SizedBox(
                height: 20,
              ),
              dropDownButtonFormFieldWidget(
                  items: ['ee', 'ww'],
                  selectedItem: unitName,
                  labelText: 'الوحدة السكنية'),
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(

                  crossAxisCount: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    ...rooms.map((e) => RoomWidget(roomItem: e))
                  ]
                      .animate(interval: Durations.short1)
                      .moveX(curve: Curves.easeIn, begin: -200, end: 0),
                ),
              ),
            ],
          ),
      ),
    
    );
  }

  List<RoomEntities> rooms = [
    RoomEntities(roomNumber: '343', status: 'خاصة', studentsNumber: 3),
    RoomEntities(roomNumber: '433', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '434', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '23', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '323', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '566', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '66', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '080', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '77', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '54', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '333', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '444', status: 'متاحة', studentsNumber: 3),
    RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'ممتلئة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 3),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
    RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  ];
}
