import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RoundedImageNetwork extends StatelessWidget {
  final String imagePath;
  final double size;

  RoundedImageNetwork({
    required Key key,
    required this.imagePath,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagePath),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
        color: Colors.black,
      ),
    );
  }
}

class RoundedImageFile extends StatelessWidget {
  final PlatformFile image;
  final double size;

  RoundedImageFile({
    required Key key,
    required this.image,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image.path),
        ),
        borderRadius: BorderRadius.all(Radius.circular(size)),
        color: Colors.black,
      ),
    );
  }
}

class RoundedImageNetworkWithStatusIndicator extends RoundedImageNetwork {
  final bool isActive;

  RoundedImageNetworkWithStatusIndicator({
    required Key key,
    required String imagePath,
    required double size,
    required this.isActive,
  }) : super(key: key, imagePath: imagePath, size: size);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        super.build(context),
        Container(
          height: size * 0.20,
          width: size * 0.20,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(size),
          ),
        ),
      ],
    );
  }
}
