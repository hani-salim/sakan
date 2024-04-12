import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/core/widgets/card_box_decoration.dart';
import 'package:sakan/features/main/presentation/widgets/service_widget.dart';

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
        const Stack(
          children: [
            SizedBox(
                height: 200,
                child: HeaderWidget(200, false, Icon(Icons.color_lens))),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: cardDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        ...services
                            .map((e) => ServiceWidget(serviceEntities: e))
                      ],
                    ),
                  ),
                ).animate().shimmer(
                    color: MyColors.primaryColor,
                    duration: const Duration(milliseconds: 800)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
