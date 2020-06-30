import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetworkHandle extends StatelessWidget {
  final String _image;
  final double _size;


  ImageNetworkHandle(this._image, [this._size]);

  @override
  Widget build(BuildContext context) {
    return Image.network(_image ?? " ",
        fit: BoxFit.fill,
        width: _size,
        height: _size, loadingBuilder: (context, child, progress) {
          return progress == null ? child : Center(child: CircularProgressIndicator());
        }, errorBuilder: (context, child, stackTrace) {
          return stackTrace == null ? child : Container(color: Colors.grey);
        });
  }
}