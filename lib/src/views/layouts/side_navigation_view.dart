import 'package:appname/src/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:appname/src/constants/constants.dart';

import '../home_view.dart';
import '../settings_view.dart';

/// Displays a Drawer / Side Navigation
///Navigate to the desire page when a user touch an item in Side Navigation
class SideNavigationView extends StatelessWidget {
  const SideNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: ColorConstants.defaultColor,
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/flutter_logo.png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                child: Center(
                  child: InkWell(
                      onTap: () async {
                        launchURL("https://kakzaki.my.id/");
                      },
                      child: Text(
                        "Powered by kakzaki",
                        style: TextStyle(color: ColorConstants.lightGray),
                      )),
                ),
                height: 30,
                color: Colors.grey[200],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: CommonConstants.normalText),
              ),
              onTap: () {
                Navigator.restorablePushReplacementNamed(
                  context,
                  HomeView.routeName,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                "Setting",
                style: TextStyle(fontSize: CommonConstants.normalText),
              ),
              onTap: () {
                Navigator.restorablePushReplacementNamed(
                  context,
                  SettingsView.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
