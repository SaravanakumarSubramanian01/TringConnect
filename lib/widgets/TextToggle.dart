import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';

class TextToggle extends StatefulWidget {
  final String activeText;
  final String inActiveText;
  const TextToggle({
    Key? key,
    required this.activeText,
    required this.inActiveText,
  }) : super(key: key);

  @override
  State<TextToggle> createState() => TextToggleState();
}

class TextToggleState extends State<TextToggle> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          child: Row(
            children: [
              Text(
                widget.inActiveText,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: CustomColor.primaryGreen),
              ),
              SvgPicture.asset(Images.arrowRight)
            ],
          ),
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          child: Row(
            children: [
              Text(
                widget.activeText,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: CustomColor.grey),
              ),
              SvgPicture.asset(Images.arrowUp)
            ],
          ),
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      );
    }
  }
}
