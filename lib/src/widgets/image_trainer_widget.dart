import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const String apiLogin = 'MobileClient';
const String apiPass = 'gA0do1ry';
final String logPassBase64 = base64.encode(utf8.encode('$apiLogin:$apiPass'));

class ImageTrainerWidget extends StatelessWidget {

  final String urlImage;
  final double height;
  final double width;



  const ImageTrainerWidget(
      {Key? key, required this.urlImage, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(1),
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.asset('assets/trainer_no_photo.png'),
        httpHeaders: {
          'Authorization': 'Basic $logPassBase64',
        },
        imageUrl: urlImage,
        height: height,
        width: width,
        alignment: Alignment.center,
        fit: BoxFit.fitWidth ,
      ),
    );
  }
}
