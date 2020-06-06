import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton with ChangeNotifier {
  bool isToggled = false;

  void toggle(){
    isToggled = !isToggled;
    notifyListeners();
  }

  Widget toggleButton() {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 80.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFF7052FB).withOpacity(0.9),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                top: 5.0,
                left: isToggled ? 40.0 : 0.0,
                right: isToggled ? 0.0: 40.0,
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )),
          ],
        ),
      ),
    );
  }

}