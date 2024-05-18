import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/button_box_decoration.dart';
import 'package:sakan/core/widgets/button_style.dart';

class ButtonWeidget extends StatelessWidget {
   const ButtonWeidget({
    super.key,
    this.formKey,
    required this.title,
    required this.onPressed,
  });

  final GlobalKey<FormState>? formKey;
  final String title;
  final Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buttonBoxDecorationWidget(),
      child: ElevatedButton(
          style: buttonStyleWidget(),
          onPressed: 
           onPressed,
          child:  Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child:Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
          ),
    );
  }
}
