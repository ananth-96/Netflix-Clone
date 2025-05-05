import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constspacings.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({required this.title,super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kheight15,
        Padding(
          padding: const EdgeInsets.only(left: 17.0,top: 5),
          child: Text(title,style:GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
       const Spacer(),
       
        Icon(Icons.cast_rounded,color: Colors.white ,size: 30,),
        kwidth10,
        Container(color: Colors.blue, height: 30,width: 30,),
        kwidth10,
      ],
    );
  }
}
