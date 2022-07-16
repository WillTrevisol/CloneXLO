import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({required this.onImageSelected, Key? key}) : super(key: key);

  final Function(String) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        enableDrag: false,
        onClosing: () {}, 
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              TextButton(
                onPressed: getFromCamera, 
                child: const Text('Câmera'),
              ),
              TextButton(
                onPressed: getFromGallery, 
                child: const Text('Galeria'),
              ),
            ],
          );
        }
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecione a origem da foto.'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        actions: <Widget> [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Text('Galeria'),
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      imageSelected(image);
    }
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = File(pickedFile.path);
      imageSelected(image);
    }
  }

  Future<void> imageSelected(File image) async {
    final cropedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Editar Imagem',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Concluir',
        ),
      ],
    );

    if (cropedFile != null) {
      onImageSelected(cropedFile.path);
    }
  }
}