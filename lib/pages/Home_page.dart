import 'package:e_commerced_app/constraints.dart/apptext.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List image = [
  'assets/image/',
  'assets/image/',
  'assets/image/',
  'assets/image/',
];
bool icecream = false, burger = false, pizze = false, burger1 = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            margin: EdgeInsets.only(top: 18, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Apptext(
                      text: 'Hello Mustafa,',
                      size: 25,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 35,
                        ))
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Apptext(text: 'Delicious Food'),
                Apptext(
                  text: 'Discover and Get in great food',
                  fontweight: FontWeight.normal,
                  size: 18,
                ),
                showItem(),
                SizedBox(height: 13),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/circular/manpizza.png',
                                height: 150,
                                width: 150,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Apptext(
                                      text: 'Pizza is dish of',
                                      size: 24,
                                    ),
                                    Apptext(
                                      text: 'fresh and healty',
                                      size: 17,
                                      fontweight: FontWeight.normal,
                                    ),
                                    Apptext(
                                      text: '\$23',
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/circular/manpizza.png',
                                height: 150,
                                width: 150,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7, right: 7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Apptext(
                                      text: 'Pizza is dish of',
                                      size: 24,
                                    ),
                                    Apptext(
                                      text: 'fresh and healty',
                                      size: 17,
                                      fontweight: FontWeight.normal,
                                    ),
                                    Apptext(
                                      text: '\$25',
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/circular/pizza2.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Apptext(
                                text: 'Pizza is best feature',
                                size: 21,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Apptext(
                                text: 'MediaQurary danger',
                                size: 19,
                                fontweight: FontWeight.normal,
                              ),
                            ),
                            Apptext(
                              text: '\$28',
                              size: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            child: Image.asset('assets/circular/pizza1.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Apptext(
                                  text: 'Pizza is best becuse the flutter',
                                  size: 21,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Apptext(
                                  text: 'MediaQurary danger',
                                  size: 19,
                                  fontweight: FontWeight.normal,
                                ),
                              ),
                              Apptext(
                                text: '\$28',
                                size: 18,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            burger = false;
            pizze = false;
            burger1 = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 60,
              width: 65,
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/image/ice.png'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = true;
            pizze = false;
            burger1 = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 60,
              width: 65,
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/image/bur_col.png'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = false;
            pizze = true;
            burger1 = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 60,
              width: 65,
              decoration: BoxDecoration(
                  color: pizze ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/image/ice.png'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            burger = false;
            pizze = false;
            burger1 = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 60,
              width: 65,
              decoration: BoxDecoration(
                  color: burger1 ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/image/ice.png'),
            ),
          ),
        ),
      ],
    );
  }
}
