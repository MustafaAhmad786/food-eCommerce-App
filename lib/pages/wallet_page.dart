import 'dart:convert';

import 'package:e_commerced_app/constraints.dart/apptext.dart';
import 'package:e_commerced_app/widget_folder/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  Map<String, dynamic>? paymentintent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.5,
                child: Container(
                    padding: EdgeInsets.only(bottom: 7),
                    width: double.infinity,
                    child: Center(
                      child: Apptext(
                        text: 'Wallets',
                        size: 26,
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(137, 185, 185, 185)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/circular/wallet.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Apptext(
                            text: 'Your Wallet',
                            size: 18,
                            fontweight: FontWeight.normal,
                          ),
                          Apptext(
                            text: "\$" + "100",
                            size: 21,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Apptext(
              text: 'Add money',
              size: 25,
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    makepayment('100');
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.1),
                        color: Colors.white),
                    child: Apptext(
                      text: "\$" + "100",
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makepayment('500');
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.2),
                        color: Colors.white),
                    child: Apptext(
                      text: "\$" + "500",
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makepayment('1000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.2),
                        color: Colors.white),
                    child: Apptext(
                      text: "\$" + "1000",
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makepayment('2000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 0.2),
                        color: Colors.white),
                    child: Apptext(
                      text: "\$" + "2000",
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.green,
              ),
              child: Center(
                child: Apptext(
                  text: 'Add Money',
                  size: 21,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makepayment(String amount) async {
    try {
      paymentintent = await createpaymeentintent(amount, 'INr');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentintent!['Client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'adnan'))
          .then((value) {});
      displayPaymentsheet(amount);
    } catch (e, s) {
      print('$e$s');
    }
  }

  displayPaymentsheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text('Payment Successfuly')
                        ],
                      )
                    ],
                  ),
                ));

        paymentintent = null;
      }).onError((error, stackTrace) {
        print('$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:-->$e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text('Canceled'),
              ));
    } catch (e) {
      print('$e');
    }
  }

  createpaymeentintent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': culcolateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('http://api.stripe.com/v1/payment_intents'),
        
        headers: {
          'authorization': 'Bearer $Secretkey',
          'contant-type': 'Application/X-www-form-urlencoded'
        },
        body: body,
      );
      print('payment intent Body->>>${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  culcolateAmount(String amount) {
    final culcolateAmount = (int.parse(amount) * 100);
    return culcolateAmount.toString();
  }
}
