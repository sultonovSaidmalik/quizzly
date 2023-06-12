import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget? child;
  final double? height;
  const Body({
    super.key,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height ?? MediaQuery.of(context).size.height * .350,
          decoration: const BoxDecoration(
            // color: AppColors.cD014FF,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/img_background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if(child != null) child!,
      ],
    );
  }
}
