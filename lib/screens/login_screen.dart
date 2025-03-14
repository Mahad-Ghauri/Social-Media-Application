import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_application/screens/signup_screen.dart';
import 'package:social_media_application/widgets/ui_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final isSmallScreen = screenSize.height < 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          
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

          UIWidgets.buildBackground(theme),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      SizedBox(height: isSmallScreen ? 20 : 30),
                      UIWidgets.buildLogo(isSmallScreen ? 80 : 100),
                      Text(
                        "Welcome back",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 16 : 24),
                      Expanded(
                        child: UIWidgets.buildGlassmorphicCard(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sign in",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 4 : 8),
                              Text(
                                "Welcome back! Please login to your account.",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 16 : 24),
                              UIWidgets.buildTextField(
                                hintText: "Email",
                                icon: Icons.email_outlined,
                                theme: theme,
                              ),
                              SizedBox(height: isSmallScreen ? 12 : 16),
                              UIWidgets.buildTextField(
                                hintText: "Password",
                                icon: Icons.lock_outline,
                                obscureText: true,
                                theme: theme,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: theme.colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: Text(
                                    "Forgot password?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: isSmallScreen ? 16 : 24),
                              UIWidgets.buildAuthButton(
                                theme,
                                "Sign in",
                                () {},
                              ),
                              SizedBox(height: isSmallScreen ? 16 : 20),
                              UIWidgets.buildDivider(),
                              SizedBox(height: isSmallScreen ? 16 : 20),
                              UIWidgets.buildSocialButtons(theme),
                              const Spacer(),
                              // Toggle to signup screen
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black54,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          SignupScreen.id,
                                        );
                                        // Navigator.pushReplacement(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder:
                                        //         (context) =>
                                        //             const SignupScreen(),
                                        //   ),
                                        // );
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            theme.colorScheme.primary,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 0,
                                        ),
                                      ),
                                      child: Text(
                                        "Sign up",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          theme: theme,
                          fadeAnimation: _fadeAnimation,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 16 : 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
