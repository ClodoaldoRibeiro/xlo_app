import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class XLOImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  XLOImageSourceSheet({this.onImageSelected});

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
      ),
      iosUiSettings: IOSUiSettings(
          title: 'Editar Imagem',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Concluir'),
    );
    if (croppedFile != null) onImageSelected(croppedFile);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Foto do anúncio",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: getFromCamera,
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/foto.png",
                          fit: BoxFit.cover,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Câmera",
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: getFromGallery,
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.asset(
                          "assets/images/galeria.png",
                          fit: BoxFit.cover,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Galeria"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }
}
