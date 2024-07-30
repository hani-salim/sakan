import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/colors/colors.dart';

import '../../../../../core/widgets/appbar.dart';
import '../../bloc/remote/bloc/student_bloc.dart';
import '../../bloc/remote/bloc/student_state.dart';
import '../registere%20_on_sakan_pages/choose_room_page.dart';
import '../registere%20_on_sakan_pages/paid_page.dart';
import '../registere%20_on_sakan_pages/send_attachment_page.dart';
import '../registere%20_on_sakan_pages/step_progress_page.dart';
import '../../widgets/buttom_buttons_widget.dart';

class RegisterOnSakanPage extends StatefulWidget {
  const RegisterOnSakanPage({super.key});

  @override
  State<RegisterOnSakanPage> createState() => _RegisterOnSakanPageState();
}

class _RegisterOnSakanPageState extends State<RegisterOnSakanPage> {
  final PageController _controller = PageController(initialPage: 0);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentBloc, StudentState>(
      listener: (context, state) {
        selectRoom(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWidget(
              text: titles[_currentPage.toInt()], context: context),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: StepProgressPage(currentStep: _currentPage, steps: 3),
              ),
              Expanded(
                  child: PageView(
                controller: _controller,
                children: const [
                  SendAttachmentPage(),
                  ChooseRoomPage(),
                  PaidPage(),
                ],
              )),
              ButtomButtons(
                controller: _controller,
              )
            ],
          ),
        );
      },
    );
  }
}

selectRoom(BuildContext context, StudentState state) {
  if (state is SelectRoomState) {
    if ((state.roomEntities.status == 'خاصة') ||
        (state.roomEntities.status == 'ممتلئة')) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('اختيار غرفة'),
                content: Text(
                    'لا يمكن حجز الغرفة لأن الغرفة ${state.roomEntities.status}'),
                icon: const Icon(Icons.house),
                iconColor: MyColors.secondaryColor,
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('اختيار غرفة'),
                icon: const Icon(Icons.house),
                iconColor: MyColors.secondaryColor,
                content: Text(
                    'هل انت متأكد من حجز الغرفة ${state.roomEntities.roomNumber} ؟'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('رجوع')),
                  TextButton(onPressed: () async {}, child: const Text('حجز ')),
                ],
              ));
    }
  }
}
