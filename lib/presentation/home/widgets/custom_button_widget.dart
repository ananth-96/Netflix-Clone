import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({required this.icon,required this.iconLabel,
    super.key,
  });
  final IconData icon;
  final String iconLabel;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon,color: Colors.white,size: 30,),Text(iconLabel,style: TextStyle(fontSize: 18,color: Colors.white),)],);
  }
}