import 'dart:async';

import 'package:flutter/material.dart';
import 'package:usersapp/authentication/auth_screen.dart';
import 'package:usersapp/global/global.dart';
import 'package:usersapp/mainScreens/home-screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _photoAnimationController;
  late Animation<double> _photoAnimation;

  @override
  void initState() {
    super.initState();

    _photoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _photoAnimation = Tween<double>(begin: 0, end: 1.18).animate(
      CurvedAnimation(
        parent: _photoAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _photoAnimationController.forward();
  }

  @override
  void dispose() {
    _photoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 116, 164),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _photoAnimationController,
              builder: (context, child) {
                return SlideTransition(
                  position: _photoAnimation.drive(Tween<Offset>(
                    begin: const Offset(0, -2), // Start from the top
                    end: const Offset(0, -1),
                  )),
                  child: Transform.scale(
                    scale: _photoAnimation.value,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/splash.jfif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Users App',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(225, 255, 182, 23),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => const AuthScreen()),
                    );
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
