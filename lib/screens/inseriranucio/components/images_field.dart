import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/widgets/xlo_image_source_sheet.dart';
import 'package:xlo_app/stores/inserir_anucio_store.dart';

import 'image_dialog.dart';

class ImagesField extends StatelessWidget {
  /*  A classe recebe um imageStore, ou seja, uam lista de imagens*/
  ImagesField({@required this.anucioStore});

  final InserirAnucioStore anucioStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: anucioStore.imagesLength < 5
                    ? anucioStore.imagesLength + 1
                    : 5,
                itemBuilder: (_, index) {
                  if (index == anucioStore.imagesLength) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => XLOImageSourceSheet(
                                    onImageSelected: (image) {
                                      anucioStore.setImage(image);
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
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                              image: anucioStore.getImage(index),
                              onDelete: () => anucioStore.removeImage(index),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              FileImage(anucioStore.getImage(index)),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
            if (anucioStore.imageError != null)
              return Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.redAccent))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    child: Text(
                      anucioStore.imageError,
                      style: TextStyle(color: Colors.redAccent, fontSize: 12),
                    ),
                  ));
            else
              return Container();
          },
        )
      ],
    );
  }
}
