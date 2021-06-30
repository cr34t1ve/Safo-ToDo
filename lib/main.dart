

import 'package:flutter/material.dart';
import 'package:safo_todo/home.dart';
import 'package:safo_todo/sizeConfig.dart';
import 'package:safo_todo/writeTask.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Home(), '/task': (context) => WriteTask()}));
}


class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    this.title,
    this.stateSetter,
    this.taskColor,
  }) : super(key: key);
  final String? title;
  final VoidCallback? stateSetter;
  final Color? taskColor;

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          print(isSelected);
        });
      },
      child: AnimatedContainer(
        width: isSelected ? 0 : getProportionateScreenWidth(329.0),
        height: isSelected ? 0 : getProportionateScreenHeight(65.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(milliseconds: 200),
        child: Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(15.0),
            ),
            Container(
              width: getProportionateScreenWidth(20.0),
              height: getProportionateScreenHeight(20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: widget.taskColor!, width: 3),
                  shape: BoxShape.circle),
              child: Visibility(
                visible: isSelected,
                child: Container(
                  color: widget.taskColor!,
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(18.0),
            ),
            Text(
              widget.title!,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
