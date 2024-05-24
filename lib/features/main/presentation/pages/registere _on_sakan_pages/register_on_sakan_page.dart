import 'package:flutter/material.dart';

import 'package:sakan/core/widgets/appbar.dart';
import 'package:sakan/features/main/presentation/pages/registere%20_on_sakan_pages/choose_room_page.dart';
import 'package:sakan/features/main/presentation/pages/registere%20_on_sakan_pages/paid_page.dart';
import 'package:sakan/features/main/presentation/pages/registere%20_on_sakan_pages/send_attachment_page.dart';
import 'package:sakan/features/main/presentation/pages/registere%20_on_sakan_pages/step_progress_page.dart';
import 'package:sakan/features/main/presentation/widgets/buttom_buttons_widget.dart';

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
    return Scaffold(
      appBar:
          appBarWidget(text: titles[_currentPage.toInt()], context: context),
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
              ChooseRoomPage(),
              SendAttachmentPage(),
              PaidPage(),
            ],
          )),
          ButtomButtons(controller: _controller,)
        ],
      ),
    );
  }
}

