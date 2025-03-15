import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_application/Controller/input_controllers.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
    _formKey.currentState?.dispose();
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      // Handle sign in logic here
      print('Form is valid');
    }
  }

  final InputControllers inputControllers = InputControllers();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final isSmallScreen = screenSize.height < 800;

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
                      SizedBox(height: 20),
                      UIWidgets.buildLogo(isSmallScreen ? 150 : 200),
                      UIWidgets.buildGlassmorphicCard(
                        context: context,
                        content: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Login",
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
                              // ------------------- Email -------------------
                              SizedBox(height: isSmallScreen ? 16 : 24),
                              UIWidgets.buildTextField(
                                hintText: "Email",
                                icon: Icons.email_outlined,
                                theme: theme,
                                controller: _emailController,
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
                                  setState(() {});
                                },
                              ),
                              // ------------------- Password -------------------
                              SizedBox(height: isSmallScreen ? 12 : 16),
                              UIWidgets.buildTextField(
                                hintText: "Password",
                                icon: Icons.lock_outline,
                                obscureText: true,
                                theme: theme,
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },
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
                                _handleSignIn,
                              ),
                              SizedBox(height: isSmallScreen ? 16 : 20),
                              UIWidgets.buildDivider(),
                              SizedBox(height: isSmallScreen ? 16 : 20),
                              UIWidgets.buildSocialButtons(theme),
                              // const Spacer(),
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
