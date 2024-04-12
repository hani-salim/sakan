import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/text_input_decoration.dart';

DropdownButtonFormField dropdownButtonFormFieldWidget({
  required List<String> items,
  required String? selectedItem,
  required String labelText,
}) {
  return DropdownButtonFormField(
    focusColor: Colors.white,
    decoration: textInputDecorationWidget(
      labelText: labelText,
    ),
    value: selectedItem,
    items: items
        .map((e) => DropdownMenuItem(
              value: e,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(e),
              ),
            ))
        .toList(),
    onChanged: (value) {
      selectedItem = value;
    },
  );
}
