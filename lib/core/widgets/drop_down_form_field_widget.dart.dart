import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/input_decoration_widget.dart';

DropdownButtonFormField<String> dropDownButtonFormFieldWidget(
    {required List<String> items,
    required String? selectedItem,
    required String labelText,
   bool? isValidate}) {
  return DropdownButtonFormField<String>(
    validator: isValidate??false ? (value){
      if(value == null){
        return validate;
      } 
      return null;
    }
    :null
    ,
    focusColor: Colors.white,
    decoration: inputDecorationWidget(
      labelText: labelText,
    ),
    items: items
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(e),
              ),
            ))
        .toList(),

    onChanged: (value) {
      selectedItem=value;
    },
  );
}
