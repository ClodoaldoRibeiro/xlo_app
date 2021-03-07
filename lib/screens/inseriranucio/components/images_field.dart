import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_app/screens/widgets/xlo_image_source_sheet.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => XLOImageSourceSheet(
                              onImageSelected: (image) {
                                Navigator.of(context).pop();
                              },
                            ));
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
