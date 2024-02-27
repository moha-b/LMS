import 'package:flutter/material.dart';

class MainCourses extends StatefulWidget {
  const MainCourses({Key? key}) : super(key: key);

  @override
  State<MainCourses> createState() => _MainCoursesState();
}

class _MainCoursesState extends State<MainCourses> {
  List RandomImages = [
    'assets/assets/instructor.png',
  ];
  List RandomMultiImages = [
    'assets/assets/instructor.png',
    'assets/assets/instructor.png',
    'assets/assets/instructor.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/dummy_image_1.png"))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 15),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Text("Power Bi advanced data analysis",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Text(
                          "  ⭐ 5.5",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: 130,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < RandomImages.length; i++)
                              Align(
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      radius: 10,
                                      backgroundImage:
                                      NetworkImage(RandomImages[i])),
                                ),
                              ),
                            Text("Heba Abd Elshafi"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$2500",
                                style: TextStyle(color: Colors.blue),
                              ),
                              Text(
                                "\$2500",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/dummy_image_1.png"))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 15),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Text("Power Bi advanced data analysis",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Text(
                          "  ⭐ 5.5",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: 130,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < RandomMultiImages.length; i++)
                              Align(
                                widthFactor: 0.5,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      radius: 10,
                                      backgroundImage:
                                      NetworkImage(RandomMultiImages[i])),
                                ),
                              ),
                            Text("Heba, Ahmed "),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$2500",
                                style: TextStyle(color: Colors.blue),
                              ),
                              Text(
                                "\$2500",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}