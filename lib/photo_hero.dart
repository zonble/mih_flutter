import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.imageURL, this.onTap, this.width})
      : super(key: key);

  final String imageURL;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: imageURL,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(imageURL, fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}
