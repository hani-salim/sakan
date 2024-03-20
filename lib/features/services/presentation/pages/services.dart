import 'package:flutter/material.dart';
import 'package:sakan/core/widgets/widgets.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}

Widget _body() {
  return Center(
    child: Icon(Icons.room_service),
  );
}
