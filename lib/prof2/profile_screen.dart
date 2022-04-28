import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_mart/login/constants/controllers.dart';
import 'package:kwik_mart/pages/payment.dart';
import 'package:kwik_mart/prof2/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 20,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          const Positioned(
            top: 50,
            right: 20,
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
          Center(
            child: Padding(
                padding:
                    const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage:  AssetImage('assets/images/avatar.jpeg'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Neel Basnet',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'neeljung@gmail.com',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.all(
                           Radius.circular(30),
                        ),
                      ),
                      height: 50,
                      width: 500,
                      child: Center(
                        child: Text(
                          'Upgrade to Premium',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentPage()),
                    );
                  },
                      child: const ProfileMenuItem(
                        text: 'Your Order History',
                        icon: Icons.shopping_bag_outlined,
                        arrowShown: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ProfileMenuItem(
                      text: 'Help & Support',
                      icon: Icons.help_outline,
                      arrowShown: true,
                    ),
                    const SizedBox(height: 20),
                    const ProfileMenuItem(
                      text: 'Load Gift Voucher',
                      icon: Icons.card_giftcard,
                      arrowShown: true,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: (() {
                        userController.signOut();
                      }),
                      child: const ProfileMenuItem(
                        text: 'Log Out',
                        icon: Icons.logout,
                        arrowShown: false,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
