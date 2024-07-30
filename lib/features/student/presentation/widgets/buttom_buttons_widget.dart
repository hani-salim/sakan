import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

class ButtomButtons extends StatelessWidget {
  final PageController controller;
  const ButtomButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(color: MyColors.primaryColor),
                ),
                shadowColor: Colors.transparent,
                elevation: 0,
                iconColor: Colors.transparent,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                Icons.arrow_back,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                shadowColor: Colors.transparent,
                elevation: 0,
                backgroundColor: MyColors.primaryColor),
            child: const SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> titles = ['اختيار غرفة', 'إرسال المرفقات', 'دفع الرسوم'];
