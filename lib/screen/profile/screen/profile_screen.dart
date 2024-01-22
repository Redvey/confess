import 'package:confess/gen/assets.gen.dart';
import 'package:confess/screen/profile/screen/desktop_profile_screen.dart';
import 'package:confess/screen/profile/screen/mobile_profile_screen.dart';
import 'package:confess/screen/profile/screen/tab_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  //route name
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.background.image().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => const MobileProfileScreen(),
          tablet: (BuildContext context) => const TabProfileScreen(),
          desktop: (BuildContext context) => const DesktopProfileScreen(),
        ),
      ),
    );
  }
}
