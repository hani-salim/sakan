import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/network/remote/dio_helper.dart';

import 'package:sakan/core/widgets/input_decoration_widget.dart';
import 'package:sakan/core/widgets/simple_loading_widget.dart';
import 'package:sakan/features/student/domain/entities/room_entities.dart';
import 'package:sakan/features/student/presentation/widgets/room_widget.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';

class ChooseRoomPage extends StatefulWidget {
  const ChooseRoomPage({
    super.key,
  });

  @override
  State<ChooseRoomPage> createState() => _ChooseRoomPageState();
}

class _ChooseRoomPageState extends State<ChooseRoomPage> {
  // late WebSocketChannel channel;
void _pollData() async {
    while (true) {
    final dio= Dio();
    final response = await dio.request('http://mhmd26221.pythonanywhere.com/api/long_polling/');
     if(response.statusCode == 200){
      print('----------------data update--------------');
      print(response.data);
     }
      await Future.delayed(const Duration(seconds: 1)); // إعادة المحاولة بعد تأخير
    }	
  }
  @override
  void initState() {
    _pollData();
    super.initState();
    
   context.read<StudentBloc>().add(GetUniversities());
  }
  //   channel = WebSocketChannel.connect(Uri.parse('wss<manifest xmlns:android="http://schemas.android.com/apk/res/android"
   //mhmd26221.pythonanywhere.com/ws/some_path/'));
  //   channel.stream.listen((data) {
  //     setState(() {
  //       print('------------------data updated-------------');
  //     });
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    // channel.sink.close();
    super.dispose();
  }

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
                collapsedHeight: 230,
                pinned: true,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      state is GetUniversitiesLoadingState
                          ? const SimpleLoadingWidget()
                          : DropdownButtonFormField<String>(
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
                                context.read<StudentBloc>().add(GetUnities(
                                    university: bloc.universityName!));
                              },
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: bloc.universityName != null,
                        child: state is GetUnitiesLoadingState
                            ? const SimpleLoadingWidget()
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
