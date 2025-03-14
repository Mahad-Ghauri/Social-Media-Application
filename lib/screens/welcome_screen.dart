import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:social_media_application/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const  String id = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Light theme aesthetic background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE0EAFC),
                  Color(0xFFCFDEF3),
                  Color(0xFFBBD2EC),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Four image animations with longer durations
          Positioned(
            top: -40,
            left: 0,
            child: FadeInUp(
              duration: Duration(seconds: 2),
              child: Image.asset(
                'assets/images/one.png',
                width: width,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: 0,
            child: FadeInUp(
              duration: Duration(seconds: 4),
              child: Image.asset(
                'assets/images/one.png',
                width: width,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -120,
            left: 0,
            child: FadeInUp(
              duration: Duration(seconds: 6),
              child: Image.asset(
                'assets/images/one.png',
                width: width,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -160,
            left: 0,
            child: FadeInUp(
              duration: Duration(seconds: 8),
              child: Image.asset(
                'assets/images/one.png',
                width: width,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Text Container
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: width * 0.9,
                    height: height * 0.4,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Welcome to Your App",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF2C5364),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "The best social media experience awaits\nThis is a prototype of the social media appiacation!",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF2C5364).withOpacity(0.8),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2C5364).withOpacity(0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
