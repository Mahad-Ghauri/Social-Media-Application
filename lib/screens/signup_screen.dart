import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_application/Controller/authentication_controller.dart';
import 'package:social_media_application/Controller/input_controllers.dart';
import 'package:social_media_application/screens/login_screen.dart';
import 'package:social_media_application/widgets/ui_widgets.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'SignupScreen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool showConfirmPassword = false;

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

  //  Instance for Authentication Controller
  final AuthenticationController authController = AuthenticationController();
  final InputControllers inputControllers = InputControllers();

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
          UIWidgets.buildBackground(theme),

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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      SizedBox(height: isSmallScreen ? 20 : 30),
                      UIWidgets.buildLogo(isSmallScreen ? 150 : 200),
                      SizedBox(height: isSmallScreen ? 16 : 24),
                      UIWidgets.buildGlassmorphicCard(
                        context: context,
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Sign up",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: isSmallScreen ? 4 : 8),
                            Text(
                              "Create a new account to get started.",
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            // ------------ Full Name ----------------
                            SizedBox(height: isSmallScreen ? 16 : 20),
                            UIWidgets.buildTextField(
                              hintText: "Full Name",
                              icon: Icons.person_outline,
                              theme: theme,
                              controller: inputControllers.nameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                inputControllers.nameController.text = value;
                              },
                            ),
                            // ------------ Email ----------------
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            UIWidgets.buildTextField(
                              hintText: "Email",
                              icon: Icons.email_outlined,
                              theme: theme,
                              controller: inputControllers.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                inputControllers.emailController.text = value;
                              },
                            ),
                            // ------------ Password ----------------
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            UIWidgets.buildTextField(
                              hintText: "Password",
                              icon: Icons.lock_outline,
                              obscureText: true,
                              theme: theme,
                              controller: inputControllers.passwordController,
                              hasSuffixIcon: true,
                              isPasswordVisible: showConfirmPassword,
                              onSuffixIconPressed:
                                  () => setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  }),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                inputControllers.passwordController.text =
                                    value;
                              },
                            ),
                            // ------------ Confirm Password ----------------
                            SizedBox(height: isSmallScreen ? 12 : 16),
                            UIWidgets.buildTextField(
                              hintText: "Confirm Password",
                              icon: Icons.lock_outline,
                              obscureText: true,
                              theme: theme,
                              controller:
                                  inputControllers.confirmPasswordController,
                              hasSuffixIcon: true,
                              isPasswordVisible: showConfirmPassword,
                              onSuffixIconPressed:
                                  () => setState(() {
                                    showConfirmPassword = !showConfirmPassword;
                                  }),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                inputControllers
                                    .confirmPasswordController
                                    .text = value;
                              },
                            ),
                            SizedBox(height: isSmallScreen ? 16 : 24),
                            UIWidgets.buildAuthButton(theme, "Sign up", () {
                              authController.signUpWithEmailPassword(
                                inputControllers.emailController.text.trim(),
                                inputControllers.passwordController.text.trim(),
                                context,
                              );
                            }),
                            SizedBox(height: isSmallScreen ? 16 : 20),
                            UIWidgets.buildDivider(),
                            SizedBox(height: isSmallScreen ? 16 : 20),
                            UIWidgets.buildSocialButtons(theme),
                            const Spacer(),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        LoginScreen.id,
                                      );

                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder:
                                      //         (context) =>
                                      //             const LoginScreen(),
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
                                      "Sign in",
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
