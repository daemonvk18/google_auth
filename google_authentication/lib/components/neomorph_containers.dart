import 'package:flutter/material.dart';

class DepthContainers extends StatelessWidget {
  const DepthContainers(
      {super.key, required this.imagestring, required this.ontap});
  final String imagestring;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(-5, -5),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(5, 5),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: Image.asset(imagestring),
        ),
      ),
    );
  }
}
