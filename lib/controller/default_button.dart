import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, required this.onTap,  this.name = 'click', required this.horizontal,
  }) : super(key: key);


  final GestureTapCallback onTap;
  final String name;
  final double horizontal;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontal),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor('#28A745'),
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: HexColor('#FFFFFF'),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
