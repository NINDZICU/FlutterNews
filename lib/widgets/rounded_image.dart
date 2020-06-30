import 'package:flutter/material.dart';
import 'image_network_handle.dart';

class RoundedImage extends StatelessWidget {
  final String _image;
  final double _size;

  RoundedImage(this._image, [this._size]);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: ImageNetworkHandle(_image, _size),
    );
  }
}
