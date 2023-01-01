import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'products_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 80, right: 80),
            child: Image.asset('lib/images/avocado.png'),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'We deliever groceries at your doorstep',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Text(
            'Order fresh groceries',
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          GestureDetector(
            onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return const ProductsPage();
              })));
            }),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
