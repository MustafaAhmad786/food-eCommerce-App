import 'package:e_commerced_app/constraints.dart/apptext.dart';
import 'package:e_commerced_app/pages/Home_page.dart';
import 'package:flutter/material.dart';

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({super.key});

  @override
  State<PizzaDetails> createState() => PpizzaDetailsState();
}

class PpizzaDetailsState extends State<PizzaDetails> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Icon(Icons.arrow_back)),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/circular/pizza.png',
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptext(
                        text: 'MediaQurary is best',
                        size: 20,
                      ),
                      Apptext(
                        text: 'chick price here',
                        size: 20,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.black),
                    child: IconButton(
                        onPressed: () {
                          if (a > 1) {
                            --a;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Apptext(
                    text: a.toString(),
                    size: 19,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.black),
                    child: IconButton(
                        onPressed: () {
                          if (a < 15) {
                            ++a;
                        
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Apptext(
                text:
                    'Why is it called Pizza? Its widely speculated that pizza came from the Greek word “pitta,” which means “pie” ; however some historians believe that pizza came from the Langobardic word bizzo, which means bite.',
                size: 15,
                fontweight: FontWeight.normal,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Apptext(
                    text: 'Delivery Time',
                    size: 20,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Icon(Icons.alarm),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Apptext(
                    text: '30 min',
                    size: 20,
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Apptext(
                        text: 'Total Price',
                        size: 20,
                      ),
                      Apptext(
                        text: '\$34',
                        size: 19,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Apptext(
                        text: 'Add chart pizza',
                        size: 14,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(97, 223, 223, 223)),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
