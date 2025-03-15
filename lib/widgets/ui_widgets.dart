import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UIWidgets {
  static Widget buildBackground(ThemeData theme) {
    return Stack(
      children: [
        // Background circles with opacity
        // Positioned(
        //   top: -100,
        //   right: -100,
        //   child: Container(
        //     width: 300,
        //     height: 300,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: theme.colorScheme.primary.withAlpha(38),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: -80,
        //   left: -80,
        //   child: Container(
        //     width: 250,
        //     height: 250,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: theme.colorScheme.primary.withAlpha(38),
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3), Color(0xFFBBD2EC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildLogo(double size) {
    return Image.asset(
      'assets/images/logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  static Widget buildTextField({
    bool obscureText = false,
    // For the Visible Password Icon
    VoidCallback? onSuffixIconPressed,
    bool hasSuffixIcon = false,
    bool isPasswordVisible = false,
    required String hintText,
    required IconData icon,
    required ThemeData theme,
    required TextEditingController controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withAlpha(204),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText && !isPasswordVisible,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.black45, fontSize: 16),
          prefixIcon: Icon(icon, color: Colors.black54, size: 22),
          suffixIcon:
              hasSuffixIcon
                  ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: onSuffixIconPressed,
                  )
                  : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: theme.colorScheme.primary.withAlpha(128),
              width: 1.5,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  static Widget buildAuthButton(
    ThemeData theme,
    String text,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withBlue(
              (theme.colorScheme.primary.blue + 20).clamp(0, 255),
            ),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withAlpha(77),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.grey.withAlpha(128), thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "or",
            style: GoogleFonts.poppins(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.grey.withAlpha(128), thickness: 1),
        ),
      ],
    );
  }

  static Widget buildSocialButtons(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSocialButton(
          icon: Icons.g_mobiledata_rounded,
          backgroundColor: Colors.white,
          iconColor: Colors.red,
          borderColor: Colors.grey.shade300,
          onPressed: () {},
        ),
      ],
    );
  }

  static Widget buildSocialButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required Color borderColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Icon(icon, color: iconColor, size: 28)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildGlassmorphicCard({
    required Widget content,
    required ThemeData theme,
    required Animation<double> fadeAnimation,
    required context,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      //
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withAlpha(204),
          border: Border.all(color: Colors.white.withAlpha(179), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FadeTransition(opacity: fadeAnimation, child: content),
            ),
          ),
        ),
      ),
    );
  }
}
