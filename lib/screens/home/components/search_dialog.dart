import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {

  SearchDialog({this.currentSearch})
      : controller = TextEditingController(text: currentSearch);

  final String currentSearch;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[700],
                  ),
                  onPressed: controller.clear,
                ),
              ),
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
        )
      ],
    );
  }
}
