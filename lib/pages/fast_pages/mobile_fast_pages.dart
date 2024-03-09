import 'package:e_commerced_app/dateDetails/Details.dart';
import 'package:e_commerced_app/login_and_sginup_page.dart/SginUp_page.dart';
import 'package:flutter/material.dart';

class FastPages extends StatefulWidget {
  const FastPages({super.key});

  @override
  State<FastPages> createState() => _FastPagesState();
}

class _FastPagesState extends State<FastPages> {
  int currentindex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: details.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset(
                          details[index].Image,
                          height: 450,
                          width: MediaQuery.of(context).size.width / 1.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          details[index].title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          details[index].descripation,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    details.length, (index) => Dots(index, context, index))),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (currentindex == details.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SginUp()));
              }
              _pageController.nextPage(
                  duration: Duration(microseconds: 500),
                  curve: Curves.bounceIn);
            },
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 47, 170, 207),
                    borderRadius: BorderRadius.circular(24)),
                child: Center(
                    child: Text(
                  currentindex == details.length - 1 ? 'Start' : 'Next',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ))),
          ),
          SizedBox(height: 13)
        ],
      ),
    );
  }

  Container Dots(BuildContext, context, int? index) {
    return Container(
      margin: EdgeInsets.only(left: 7),
      height: 10.1,
      width: currentindex == index ? 25 : 7,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
