import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/input_decoration_widget.dart';

class SendAttachmentPage extends StatefulWidget {
  const SendAttachmentPage({super.key});

  @override
  State<SendAttachmentPage> createState() => _SendAttachmentPageState();
}

class _SendAttachmentPageState extends State<SendAttachmentPage> {
  @override
  Widget build(BuildContext context) {
    String? registerType;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              validator: (value) {
                if (value == null) {
                  return validate;
                }
                return null;
              },
              focusColor: Colors.white,
              decoration: inputDecorationWidget(
                labelText: 'نوع التسجيل',
              ),
              items: ['قدامى']
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(e),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {setState(() {
                registerType = value;
              });
                
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
                visible: registerType == 'قامى' ? true : false,
                child: const Column(
                  children: [

Text('data')                  ],
                ))
          ],
        ),
      ),
    );
  }
}
