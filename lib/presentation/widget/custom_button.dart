import 'package:flutter/material.dart';
import 'package:quiz2/core/utils/string_manager.dart';

// ignore: must_be_immutable
class CustumButtom extends StatelessWidget {
  CustumButtom(
      {super.key,
      required this.text,
      required this.press,
      required this.width,
      required this.height});
  final String text;
  void Function()? press;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: StringManager.manrope),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              )
            ],
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
