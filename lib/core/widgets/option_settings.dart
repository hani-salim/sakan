import 'package:flutter/material.dart';
import 'button_box_decoration.dart';

Padding options({
  required BuildContext context,
  required String title,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: double.infinity,
      decoration: buttonBoxDecorationWidget(),
      child: TextButton(
          onPressed: () {
            controller.text = title;
            Navigator.pop(context);
          },
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
    ),
  );
}

MaterialButton buildAccountOption({required String title, Function? onTap}) {
  return MaterialButton(
    onPressed: () {
      onTap;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
