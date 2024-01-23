import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:confess/screen/dashboard/widget/molecule/confess_widget.dart';
import 'package:confess/screen/dashboard/widget/molecule/navbar.dart';
import 'package:confess/screen/dashboard/widget/organism/dashboard_banner.dart';
import 'package:confess/screen/profile/screen/desktop_profile_screen.dart';
import 'package:confess/screen/profile/widget/molecule/navbar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MobileProfileScreen extends StatefulWidget {
  const MobileProfileScreen({super.key});

  //route name
  static const String routeName = '/profile';

  @override
  State<MobileProfileScreen> createState() => _MobileProfileScreenState();
}

class _MobileProfileScreenState extends State<MobileProfileScreen> {
  late DashboardBloc dashboardBloc;

  @override
  void initState() {
    dashboardBloc = context.read<DashboardBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const NavBar(),
          const ProfileImage(
            height: 300,
            bannerHeight: 164,
            bannerToTextHeight: 70,
            width: double.infinity,
            logoutWidth: double.infinity,
            pfpPositionLeft: 140,
            pfpPositionTop: 70,
            pfpRadius: 70,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFE),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Posted Confessions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 66,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD3DFFD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.43),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sort,
                                size: 14,
                                color: Color(0xFF01308F),
                              ),
                              Text(
                                'Sort',
                                style: TextStyle(
                                  color: Color(0xFF01308F),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<DashboardBloc, DashboardState>(
                    bloc: dashboardBloc,
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        loaded: (confessionList) => Center(
                          child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: confessionList.length,
                            crossAxisCount: 1,
                            itemBuilder: (context, index) => ConfessWidget(
                              confession: confessionList[index],
                            )
                                .animate(
                                    delay: const Duration(milliseconds: 400))
                                .fadeIn(
                                    duration: const Duration(milliseconds: 500))
                                .moveY(begin: 16, end: 0),
                          ),
                        ),
                        error: (message) => Center(
                          child: Text(message),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
