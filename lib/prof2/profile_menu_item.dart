import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuItem extends StatelessWidget {
   const ProfileMenuItem(
      {Key? key, required this.text, required this.icon, required this.arrowShown}) : super(key: key);
  final String text;
  final IconData icon;
  final bool arrowShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      height: 50,
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          arrowShown
              ? const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
