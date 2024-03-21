import 'package:flutter/material.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    super.key,
    required this.pimagePath,
  });

  final String pimagePath;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.pimagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text('식물 이름 \n 식물 가격'),
            ),
          ],
        )
      ],
    );
  }
}
