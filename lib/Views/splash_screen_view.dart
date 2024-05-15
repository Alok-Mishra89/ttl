import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  void initState () {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/loginpage');
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Timeless Trends",
              style: GoogleFonts.acme(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .09,),
            Image.asset("images/intro.jpg", fit: BoxFit.fill,height: height * .5,),
            SizedBox(height: height * .09,),
            const SpinKitCircle(
              size: 50,
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
