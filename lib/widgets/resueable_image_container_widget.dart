
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ResueableImageContainerWidget extends StatelessWidget {

  double? heignt;
  double? width;
  String? imageUrl;


  ResueableImageContainerWidget({this.heignt, this.width, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heignt,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageUrl!))
      ),
    );
  }
}
