import 'package:flutter/material.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/presentation/widgets/card_widget.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(body: _body());
  }
}

Widget _body() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
          child: CardWidget(
            cardEntities: mainCard,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 4,
            children: [...items.map((e) => CardWidget(cardEntities: e))],
          ),
        ),
      ],
    ),
  );
}
