import 'package:flutter/material.dart';


MaterialButton buildAccountOptionWidget({required String title, Function? onTap}) {
  return MaterialButton(
    onPressed: () {
      onTap;
    },
      child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
   
  );
}
