import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_app/features/main_navigation/main_navigation_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    details.delta.dx > 0
        ? _direction = Direction.right
        : _direction = Direction.left;

    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    _direction == Direction.left
        ? _showingPage = Page.second
        : _showingPage = Page.first;

    setState(() {});
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Follow the rules',
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Take care one another. Please!',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size24,
            horizontal: Sizes.size24,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showingPage == Page.first ? 0 : 1,
            child: CupertinoButton(
              onPressed: _onEnterAppTap,
              color: Theme.of(context).primaryColor,
              child: const Text('Start'),
            ),
          ),
        )),
      ),
    );
  }
}
