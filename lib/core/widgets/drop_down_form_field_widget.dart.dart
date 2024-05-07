import 'package:flutter/material.dart';
import 'text_input_decoration.dart';
// ignore: must_be_immutable
class DropDownButtonFormFieldWidget extends StatelessWidget {
  final List<String> items;
   String? selectedItem;
  final String labelText;
  final FormFieldValidator? validator;
   DropDownButtonFormFieldWidget({
    required this.items,
    required this.selectedItem,
    required this.labelText,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator,
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
}
