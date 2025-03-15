import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class InterfacePage extends StatefulWidget {
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late Animation<double> _animation;
  late AnimationController _animationController;

  // Placeholder pages for each tab
  final List<Widget> _pages = [
    const Center(child: Text('Home Feed')),
    const Center(child: Text('Upload')),
    const Center(child: Text('Profile')),
  ];

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Social Media',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          // Messages button
          IconButton(
            icon: const Icon(Ionicons.chatbubble_outline),
            onPressed: () {
              // Navigate to messages
            },
          ),
          const SizedBox(width: 8),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionBubble(
        animation: _animation,
        onPress:
            () =>
                _animationController.isCompleted
                    ? _animationController.reverse()
                    : _animationController.forward(),
        iconColor: Colors.white,
        iconData: Icons.chat,
        backGroundColor: Theme.of(context).primaryColor,
        items: [
          Bubble(
            title: "Chat with AI",
            iconColor: Colors.white,
            bubbleColor: Theme.of(context).primaryColor,
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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.home_outline),
              activeIcon: const Icon(Ionicons.home),
              title: const Text('Home'),
              selectedColor: Theme.of(context).primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.add_circle_outline),
              activeIcon: const Icon(Ionicons.add_circle),
              title: const Text('Upload'),
              selectedColor: Theme.of(context).primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Ionicons.person_outline),
              activeIcon: const Icon(Ionicons.person),
              title: const Text('Profile'),
              selectedColor: Theme.of(context).primaryColor,
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
