import 'dart:async';

import 'package:flutter/material.dart';
import 'package:safo_todo/list.dart';
import 'package:safo_todo/sizeConfig.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(89.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Kwabena's Todo",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(9.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Tasks",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(70.0),
                    ),
                  ],
                ),
              ),
              Container(
                height: 107,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(19.0),
                    ),
                    Center(
                      child: Container(
                        width: getProportionateScreenWidth(195.0),
                        height: getProportionateScreenHeight(107),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(29.0),
                              vertical: getProportionateScreenHeight(16.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '13 tasks',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'School',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: getProportionateScreenWidth(25),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(3.0),
                              ),
                              Container(
                                width: getProportionateScreenWidth(86),
                                height: getProportionateScreenHeight(6),
                                decoration:
                                    BoxDecoration(color: Color(0xFF3FD972)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(29.0),
                    ),
                    Center(
                      child: Container(
                        width: getProportionateScreenWidth(195.0),
                        height: getProportionateScreenHeight(107),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(29.0),
                              vertical: getProportionateScreenHeight(16.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5 tasks',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'Personal',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: getProportionateScreenWidth(25),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(3.0),
                              ),
                              Container(
                                width: getProportionateScreenWidth(86),
                                height: getProportionateScreenHeight(6),
                                decoration:
                                    BoxDecoration(color: Color(0xFFFF5BE4)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                  itemCount: taskList.length,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  itemBuilder: (context, index) => TaskCard(
                    title: taskList[index].taskName,
                    taskColor: taskList[index].catergory == 'school'
                        ? Color(0xFF3FD972)
                        : Color(0xFFFF5BE4),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: getProportionateScreenHeight(38),
            right: getProportionateScreenWidth(23),
            child: Container(
              height: getProportionateScreenHeight(71),
              width: getProportionateScreenWidth(71),
              child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xFF1510F0),
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 41,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
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
