import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakan/core/widgets/input_decoration_widget.dart';
import 'package:sakan/core/widgets/simple_loading_widget.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/presentation/widgets/room_widget.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';

class ChooseRoomPage extends StatelessWidget {
  const ChooseRoomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<StudentBloc>(context);
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: 230  ,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        focusColor: Colors.white,
                        decoration: inputDecorationWidget(
                          labelText: 'اسم الجامعة',
                        ),
                        items: bloc.universities
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Center(child: Text(e)),
                                ))
                            .toList(),
                        value: bloc.universityName,
                        onChanged: (String? value) {
                          bloc.universityName = value!;
                          context.read<StudentBloc>().add(
                              GetUnities(university: bloc.universityName!));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: bloc.universityName != null,
                        child: state is GetUnitiesLoadingState
                            ? 
                      
                             const SimpleLoadingWidget()
                            
                            : DropdownButtonFormField<String>(
                                focusColor: Colors.white,
                                decoration: inputDecorationWidget(
                                  labelText: 'اسم الوحدة',
                                ),
                                items: bloc.unities
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Center(child: Text(e)),
                                        ))
                                    .toList(),
                                value: bloc.unitName,
                                onChanged: (String? value) async {
                                  bloc.unitName = value!;
                                  context.read<StudentBloc>().add(GetRooms(
                                      university: bloc.universityName!,
                                      unit: bloc.unitName!));
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: state is GetRoomsLoadingState
                    ? const SimpleLoadingWidget()
                      
                    : Visibility(
                        visible: bloc.unitName != null,
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
                                    ...bloc.rooms
                                        .map((e) => RoomEntities(
                                            roomNumber: e['room_number'],
                                            studentsNumber:
                                                e['number_of_students']))
                                        .map((e) => RoomWidget(roomItem: e))
                                  ])
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
}


