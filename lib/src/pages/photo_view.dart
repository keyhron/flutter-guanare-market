import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:photo_view/photo_view.dart';

import 'package:guanare_market/src/widgets/Molecules/custom_appbar.dart';

class PhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String image = Get.arguments;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: Hero(
                  tag: image,
                  child: PhotoView(
                    backgroundDecoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    imageProvider: AssetImage(image),
                  ),
                ),
              ),
            ),
            CustomAppBar(isBack: true, backgroundOpacity: true),
          ],
        ),
      ),
    );
  }
}
