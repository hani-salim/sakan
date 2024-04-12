import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakan/config/theme/header_widget.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/presentation/bloc/widget_bloc.dart';
import 'package:sakan/features/main/presentation/widgets/theme_widget.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WidgetBloc, WidgetState>(
      listener: (context, state) {},
      builder: (contextm, state) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              MyColors.primaryColor.withOpacity(0.3),
              MyColors.secondaryColor.withOpacity(0.3),
            ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                  child: HeaderWidget(200, true, Icon(Icons.color_lens)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      ...themes.map((e) => ThemeWidget(
                            primaryColor: e.primaryColor,
                            secondaryColor: e.secondaryColor,
                            item: e,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
