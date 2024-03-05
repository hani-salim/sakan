import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';

AppBar appBar({required text, required BuildContext context}) {
  //app bar
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    elevation: 0.0,
    iconTheme: const IconThemeData(color: Colors.white),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            MyColors.primaryColor,
            MyColors.secondaryColor,
          ])),
    ),
  );
}

//box decoration
BoxDecoration inputBoxDecorationShaddow() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      offset: const Offset(0, 5),
    )
  ]);
}

//text input decoration
InputDecoration textInputDecoration(
    {String labelText = "",
    String hintText = "",
    bool showPassword = true,
    bool obSecure = false,
    IconButton? suffixIcon}) {
  return InputDecoration(
    suffixIcon: obSecure ? suffixIcon : null,
    labelText: labelText,
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: MyColors.primaryColor)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: Colors.grey.shade400)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
  );
}

//button box decoration
BoxDecoration buttonBoxDecoration(
    {required BuildContext context, Color? color1, Color? color2}) {
  Color c1 = MyColors.primaryColor;
  Color c2 = MyColors.secondaryColor;
  if (color1 != null) {
    c1 = color1;
  }
  if (color2 != null) {
    c2 = color2;
  }

  return BoxDecoration(
    boxShadow: const [
      BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0],
      colors: [
        c1,
        c2,
      ],
    ),
    color: Colors.deepPurple.shade300,
    borderRadius: BorderRadius.circular(30),
  );
}

//button style
ButtonStyle buttonStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    minimumSize: MaterialStateProperty.all(const Size(50, 50)),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromARGB(0, 255, 4, 4)),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );
}

//alert dialog
AlertDialog alertDialog(String title, String content, BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black38)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}

Padding options({
  required BuildContext context,
  required String title,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: double.infinity,
      decoration: buttonBoxDecoration(context: context),
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

// Show toast
// Future<bool?> showToast(
//     {required Color color, required String msg, Toast? toastLength}) {
//   return Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: color,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }



