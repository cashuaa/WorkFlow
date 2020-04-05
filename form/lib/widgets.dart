import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class MyImageWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/startupLogo.png');
    var image = new Image(image: assetsImage);
    return new Container(child: image);
  }
}

