

import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: 'الخدمات', context: context),
      body: _body(),
    );
  }
}

Widget _body() {
  return 
 Container(
  color: const Color.fromARGB(255, 0, 0, 0),
   child: GridView.builder(
    padding: const EdgeInsets.all(10),
    itemCount: 100,
    
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 20.0, crossAxisSpacing: 20),
          itemBuilder: ((context, index) => Center(
                  child: Container(
                decoration: buttonBoxDecoration(context: context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$index',
                    style: const TextStyle(
                        fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
              ))),
    ),
 );
}
