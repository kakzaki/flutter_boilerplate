import 'package:appname/src/constants/constants.dart';
import 'package:appname/src/controllers/bottom_navigation_controller.dart';
import 'package:appname/src/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import '../counter_view.dart';
import '../home_view.dart';
import '../settings_view.dart';

/// Displays a Bottom Navigation
/// When a user touch an Item in Bottom Navigation, the BottomNavigationController is updated and
/// Page (Widget) that listen to the BottomNavigationController are rebuilt.
class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView(
      {Key? key,
      required this.settingController,
      required this.bottomNavigationController})
      : super(key: key);

  static const routeName = '/';

  final SettingsController settingController;
  final BottomNavigationController bottomNavigationController;

  @override
  Widget build(BuildContext context) {
    List<Widget> viewScreen = [
      HomeView(),
      const CounterView(),
      SettingsView(settingController: settingController)
    ];
    return AnimatedBuilder(
        animation: bottomNavigationController,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            body: viewScreen[bottomNavigationController.index],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorConstants.bottomNavigationBackgroundColor,
              currentIndex: bottomNavigationController.index,
              selectedItemColor: ColorConstants.black,
              unselectedItemColor: ColorConstants.darkGray,
              type: BottomNavigationBarType.fixed,
              onTap: (newIndex) async {
                bottomNavigationController.updateIndex(newIndex);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                  ),
                  label: "Counter",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Setting",
                )
              ],
            ),
          );
        });
  }
}
