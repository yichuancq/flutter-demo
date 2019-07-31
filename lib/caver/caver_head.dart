import 'package:flutter/material.dart';

class ArcBannerImage extends StatelessWidget {
//  ArcBannerImage(this.imageUrl);
  ArcBannerImage();
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      //裁剪图形
      clipper: ArcClipper(),
      child: Image.asset(
        imageUrl,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}
