import 'package:flutter/material.dart';

class XLOSuccessBox extends StatelessWidget {
  XLOSuccessBox({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      color: Colors.green[300],
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            Icons.thumb_up_outlined,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              'Olá, $message .',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
