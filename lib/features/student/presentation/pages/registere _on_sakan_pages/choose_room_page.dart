import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/widgets/drop_down_form_field_widget.dart.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_bloc.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_state.dart';
import 'package:sakan/features/student/presentation/widgets/room_widget.dart';

// ignore: must_be_immutable
class ChooseRoomPage extends StatelessWidget {
  const ChooseRoomPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String universityName = '';
    String unitName = '';
    var rooms = BlocProvider.of<ServicesBloc>(context).rooms.map((e) =>
        RoomEntities(roomNumber: e[''], status: e[''], studentsNumber: e['']));
    return BlocConsumer<ServicesBloc, ServicesState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                          items: BlocProvider.of<ServicesBloc>(context)
                              .universities
                              .map((e) => e.toString())
                              .toList(),
                          selectedItem: universityName,
                          event: GetUnities(university: universityName),
                          labelText: 'اسم الجامعة', ),
                  
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: universityName != '',
                        child: dropDownButtonFormFieldWidget(
                            items: BlocProvider.of<ServicesBloc>(context)
                                .unities
                                .map((e) => e.toString())
                                .toList(),
                            selectedItem: unitName,
                            event: GetRooms(
                                university: universityName, unit: unitName),
                            labelText: 'اسم الوحدة'),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: unitName != '',
                child: state is GetRoomsLoadingState
                    ? Center(
                      child: CircularProgressIndicator(
                          color: MyColors.primaryColor,
                        ),
                    )
                    : SliverToBoxAdapter(
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
                                children: [
                                  ...rooms.map((e) => RoomWidget(roomItem: e))
                                ]
                                    .animate(
                                        interval:
                                            const Duration(milliseconds: 10))
                                    .moveX(begin: -100, end: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  // List<RoomEntities> rooms = [
  //   RoomEntities(roomNumber: '343', status: 'خاصة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '433', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '434', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '23', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '323', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '566', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '66', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '080', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '77', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '54', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '333', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '444', status: 'متاحة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'متاحة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'ممتلئة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 3),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  //   RoomEntities(roomNumber: '4', status: 'فارغة', studentsNumber: 0),
  // ];
}
