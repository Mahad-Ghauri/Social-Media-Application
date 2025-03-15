import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class InterfacePage extends StatefulWidget {
  static const String id = 'InterfacePage';
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late Animation<double> _animation;
  late AnimationController _animationController;

  // App theme colors
  final Color primaryColor = const Color(0xFF6200EE);
  final Color secondaryColor = const Color(0xFF03DAC6);
  final Color backgroundColor = const Color(0xFFF5F5F5);

  // Placeholder pages for each tab with proper padding
  late final List<Widget> _pages;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    // Initialize pages with proper padding
    _pages = [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Home Feed', style: TextStyle(fontSize: 18))),
      ),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Upload', style: TextStyle(fontSize: 18))),
      ),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Profile', style: TextStyle(fontSize: 18))),
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Social Media',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          // Messages button
          IconButton(
            icon: const Icon(Ionicons.chatbubble_outline, color: Colors.white),
            onPressed: () {
              // Navigate to messages
            },
          ),
          const SizedBox(width: 8),
        ],
        elevation: 0,
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(child: _pages[_currentIndex]),
      floatingActionButton: FloatingActionBubble(
        animation: _animation,
        onPress:
            () =>
                _animationController.isCompleted
                    ? _animationController.reverse()
                    : _animationController.forward(),
        iconColor: Colors.white,
        iconData: Icons.chat,
        backGroundColor: secondaryColor,
        items: [
          Bubble(
            title: "Chat with AI",
            iconColor: Colors.white,
            bubbleColor: secondaryColor,
            icon: Icons.chat,
            titleStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            onPress: () {
              // Navigate to AI chat
              _animationController.reverse();
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.home_outline),
              activeIcon: const Icon(Ionicons.home),
              title: const Text('Home'),
              selectedColor: Colors.white,
              unselectedColor: Colors.white.withOpacity(0.7),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.add_circle_outline),
              activeIcon: const Icon(Ionicons.add_circle),
              title: const Text('Upload'),
              selectedColor: Colors.white,
              unselectedColor: Colors.white.withOpacity(0.7),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.person_outline),
              activeIcon: const Icon(Ionicons.person),
              title: const Text('Profile'),
              selectedColor: Colors.white,
              unselectedColor: Colors.white.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
