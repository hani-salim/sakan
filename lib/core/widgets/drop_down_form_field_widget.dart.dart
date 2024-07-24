import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/input_decoration_widget.dart';
import 'package:sakan/features/student/presentation/bloc/remote/bloc/services_bloc.dart';

DropdownButtonFormField<String> dropDownButtonFormFieldWidget(
    {required List<String> items,
    required String? selectedItem,
    required String labelText,
     BuildContext? context,
     ServicesEvent? event,
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
              child: Center(child: Text(e)),
            ))
        .toList(),

    onChanged: (value) {
      selectedItem=value;
      context?.read<ServicesBloc>().add(event!);
    },
  );
}
