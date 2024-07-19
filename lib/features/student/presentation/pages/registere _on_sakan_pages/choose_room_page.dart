import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/drop_down_form_field_widget.dart.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/presentation/widgets/room_widget.dart';


// ignore: must_be_immutable
class ChooseRoomPage extends StatelessWidget {
  ChooseRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    String universityName = '';
    String unitName = '';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 200,
            pinned: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  dropDownButtonFormFieldWidget(
                      items: [],
                      selectedItem: universityName,
                      labelText: 'اسم الجامعة'),
                  const SizedBox(
                    height: 20,
                  ),
                  dropDownButtonFormFieldWidget(
                      items: [],
                      selectedItem: unitName,
                      labelText: 'اسم الوحدة'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 5,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    mainAxisSpacing: 8,
                    children: [...rooms.map((e) => RoomWidget(roomItem: e))],
                  ),
                ],
              ),
            ),
          ),
        ],
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
