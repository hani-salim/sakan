import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/constant.dart';
import 'input_decoration_widget.dart';
import '../../features/student/presentation/bloc/remote/bloc/student_bloc.dart';

DropdownButtonFormField<String> dropDownButtonFormFieldWidget(
    {required List<String> items,
    required String? selectedItem,
    required String labelText,
    String? university,
    BuildContext? context,
    String? event,
    String? value,
    bool? isValidate}) {
  return DropdownButtonFormField<String>(
    value: value,
    validator: isValidate ?? false
        ? (value) {
            if (value == null) {
              return validate;
            }
            return null;
          }
        : null,
    focusColor: Colors.white,
    decoration: inputDecorationWidget(
      labelText: labelText,
    ),
    items: items
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Center(child: Text(e)),
            ))
        .toList(),
    onChanged: (v) async {
      selectedItem = v;
    },
    
  );
}
