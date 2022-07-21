import 'dart:io';

import 'package:clone_xlo_flutter/stores/create_ad_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../widgets/error_box.dart';
import 'image_dialog.dart';
import 'image_source_modal.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({required this.controller, Key? key}) : super(key: key);

  final CreateAdStore controller;

  @override
  Widget build(BuildContext context) {

    void onImageSelected(String path) {
      controller.images.add(path);
      Navigator.of(context).pop();
    }

    return Column(
      children: <Widget> [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.images.length < 5 ? controller.images.length + 1 : 5,
                itemBuilder: (context, index) {
                  if (index == controller.images.length) {
                    return GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(
                            context: context, 
                            builder: (_) => ImageSourceModal(onImageSelected: onImageSelected),
                          );
                        } else {
                          showCupertinoModalPopup(
                            context: context, 
                            builder: (_) => ImageSourceModal(onImageSelected: onImageSelected),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context, 
                          builder: (_) => ImageDialog(
                            image: controller.images[index],
                            onDelete: () => controller.images.removeAt(index),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
                        child: CircleAvatar(
                          
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: controller.images[index] is File 
                          ? FileImage(File(controller.images[index])) : NetworkImage(controller.images[index]) as ImageProvider
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
          builder: (_) => controller.imagesError != null ? ErrorBox(message: controller.imagesError, radius: 0) : Container(height: 0), 
        ),
      ],
    );
  }
}