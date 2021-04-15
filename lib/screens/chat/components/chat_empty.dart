import 'package:flutter/material.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';

class ChatEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.chat  ,
            color: AppColors.COR_PALLETA[400],
            size: 150,
          ),
          const SizedBox(height: 50,),
          Text(
            'Você não tem chats ativos',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            'Assim que uma nova conversa for iniciada, ela aparecerá aqui.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
