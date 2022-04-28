import 'package:flutter/material.dart';
import 'package:kwik_mart/animation/fade_animation.dart';
import 'package:kwik_mart/home.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(40.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimation(
                  1.2,
                  Image.network(
                    'https://ouch-cdn2.icons8.com/7fkWk5J2YcodnqGn62xOYYfkl6qhmsCfT2033W-FjaA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMjU5/LzRkM2MyNzJlLWFh/MmQtNDA3Ni04YzU0/LTY0YjNiMzQ4NzQw/OS5zdmc.png',
                    width: 250,
                  )),
              const SizedBox(
                height: 50.0,
              ),
              const FadeAnimation(
                  1.2,
                  Text(
                    'Payment Success! 🥳',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    'Hooray! Your payment proccess has \n been completed successfully..',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
                  )),
              const SizedBox(
                height: 140.0,
              ),
              FadeAnimation(
                1.2,
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  height: 50,
                  elevation: 0,
                  splashColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.yellow[800],
                  child: const Center(
                    child: Text(
                      "Back to Home",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const FadeAnimation(
                  1.2,
                  Text(
                    'Thank you for shopping with us.',
                    style:  TextStyle(fontSize: 14.0, color: Colors.grey),
                  )),
            ],
          ),
        ));
  }
}
