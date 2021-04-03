import 'package:flutter/material.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';

class BarButton extends StatelessWidget {
  BarButton({this.label, this.decoracao, this.onTap});

  final String label;
  final BoxDecoration decoracao;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: decoracao,
          alignment: Alignment.center,
          height: 40,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
