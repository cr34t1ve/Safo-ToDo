import 'package:flutter/material.dart';
import 'package:safo_todo/sizeConfig.dart';

class WriteTask extends StatefulWidget {
  @override
  _WriteTaskState createState() => _WriteTaskState();
}

class _WriteTaskState extends State<WriteTask> {
  TextEditingController _commentController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(67),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add to School',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  'Cancel',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1510F0)),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(68),
            ),
            TextField(
              controller: _commentController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add Comments',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFC1C1C1)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(99),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write Your Task Here',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: getProportionateScreenWidth(25),
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFC1C1C1)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(344),
            ),
            Container(
              width: getProportionateScreenWidth(164),
              height: getProportionateScreenHeight(61),
              decoration: BoxDecoration(
                color: Color(0xFF1510F0),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF1510F0).withOpacity(0.4),
                      blurRadius: 48.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.0, 25.0))
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
