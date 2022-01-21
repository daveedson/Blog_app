// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class OtherNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(right: 12.0),
     child: Container(
      height: 95.0,
      width: double.infinity,
      decoration: BoxDecoration(
       color: Colors.transparent,
      ),
      child: Row(
       children: [
        ClipRRect(
         borderRadius: BorderRadius.circular(15.0),
         child: Image.asset(
          'images/ppw.jpeg',
          height: 95.0,
          width: 105.0,
          fit: BoxFit.cover,
         ),
        ),
        SizedBox(width: 10.0),
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          SizedBox(
           width: 200.0,
           child: Text(
            'Ronaldo continues goal drought after 8 games',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 17.0),
           ),
          ),
          SizedBox(height: 25.0),
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
            Icon(Icons.thumb_up_alt_outlined,color: Color(0xFF7D7D7D),size: 18.0,),
            Text('2.2k',style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(width: 5.0,),
            Icon(Icons.message_outlined,color: Color(0xFF7D7D7D),size: 18.0,),
            Text('1.2k',style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(width: 5.0,),
            Icon(Icons.calendar_today,color: Color(0xFF7D7D7D),size: 18.0,),
            Text('12 Jan 2021',style: TextStyle(fontWeight: FontWeight.w400),)
           ],
          )
         ],
        ),
       ],
      ),
     ),
    );
  }
}
