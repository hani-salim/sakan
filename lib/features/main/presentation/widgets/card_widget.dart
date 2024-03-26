import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/main/domain/entities/card_item.dart';

class CardWidget extends StatefulWidget {
  final CardEntities cardEntities;
  const CardWidget({super.key, required this.cardEntities});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTapDown: (_) =>
                setTapped(item: widget.cardEntities, isTapped: true),
            onTapCancel: () =>
                setTapped(item: widget.cardEntities, isTapped: false),
            onTapUp: (_) =>
                setTapped(item: widget.cardEntities, isTapped: false),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Opacity(
                  opacity: widget.cardEntities.isTapped ? 0.5 : 1,
                  child: Container(
                    height: widget.cardEntities.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: const [
                            0.0,
                            1.0
                          ],
                          colors: [
                            widget.cardEntities.color,
                            MyColors.secondaryColor
                          ]),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 5),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image(
                      fit: BoxFit.contain,
                      width: double.infinity,
                      image: AssetImage(
                        widget.cardEntities.url,
                      ),
                    ),
                  ),
                ),
                if (!widget.cardEntities.isTapped)
                  Text(
                    widget.cardEntities.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void setTapped({required CardEntities item, required bool isTapped}) {
    setState(() {
      for (int i = 0; i < items.length; i++) {
        if (item == items[i]) {
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
