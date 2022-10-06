import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final IconData? iconData;
  final Color? color;

  const CircleButton({Key? key, this.onTap, this.iconData, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 10.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: iconData == null
            ? const Text("")
            : Icon(
                iconData,
                color: Colors.transparent,
              ),
      ),
    );
  }
}
