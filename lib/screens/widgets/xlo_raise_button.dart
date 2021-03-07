import 'package:flutter/material.dart';


class XLORaiseButton extends StatelessWidget {

  XLORaiseButton({@required this.child, @required this.pressed });

  final VoidCallback pressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.only(top: 26, bottom: 12),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)),
        color: Colors.orangeAccent,
        child: child,
        textColor: Colors.white,
        disabledColor: Colors.orange.withAlpha(120),
        onPressed: pressed,
      ),
    );
  }
}
