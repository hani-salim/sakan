import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/domain/entities/service_item.dart';

class ServiceWidget extends StatefulWidget {
  final ServiceEntities serviceEntities;
  const ServiceWidget({super.key, required this.serviceEntities});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.serviceEntities.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          gradient: widget.serviceEntities.isTapped
              ? LinearGradient(
                  colors: [MyColors.primaryColor, MyColors.secondaryColor])
              : null),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTapDown: (_) =>
                  setTapped(item: widget.serviceEntities, isTapped: true),
              onTapCancel: () =>
                  setTapped(item: widget.serviceEntities, isTapped: false),
              onTapUp: (_) =>
                  setTapped(item: widget.serviceEntities, isTapped: false),
              child: Opacity(
                  opacity: widget.serviceEntities.isTapped ? 0.9 : 1,
                  child: Image(
                    fit: BoxFit.contain,
                    width: double.infinity,
                    image: AssetImage(
                      widget.serviceEntities.url,
                    ),
                  )),
            ),
          ),
          Text(
            widget.serviceEntities.title,
            style: TextStyle(
                color: !widget.serviceEntities.isTapped
                    ? MyColors.primaryColor
                    : MyColors.white,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  void setTapped({required ServiceEntities item, required bool isTapped}) {
    setState(() {
      for (int i = 0; i < services.length; i++) {
        if (item == services[i]) {
          item.isTapped = isTapped;
        }
      }
      if (item == mainCard) {
        setState(() {
          item.isTapped = isTapped;
        });
      }
    });
  }
}
