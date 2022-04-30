import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatefulButton extends StatefulWidget{
  final String activeIcon;
  final String inActiveIcon;
  final void Function(bool state)? callback;
  final bool resetState;
  const StatefulButton({Key? key, required this.activeIcon,
    required this.inActiveIcon,this.callback, required this.resetState,}) : super(key: key);

  @override
  State<StatefulButton> createState() => StatefulButtonState();
}

class StatefulButtonState extends State<StatefulButton>{
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    if(widget.resetState){
      isActive = false;
    }
  }

  @override
  void didUpdateWidget(covariant StatefulButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.resetState){
      isActive = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.resetState.toString());
    if(!isActive){
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          child:SvgPicture.asset(widget.inActiveIcon,),
          onTap: (){
            if(widget.callback != null){
              widget.callback!(isActive);
            }
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          child:SvgPicture.asset(widget.activeIcon),
          onTap: (){
            if(widget.callback != null){
              widget.callback!(isActive);
            }
            setState(() {
              isActive = !isActive;
            });
          },
        ),

      );
    }
  }

}