import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif/gif.dart';
import 'package:traning/new/shared/constants/colors.dart';
import 'package:traning/new/shared/constants/images.dart';

class BottomNavItems {
  static List<BottomNavigationBarItem> getItems(
      BuildContext context,
      GifController controller1,
      GifController controller2,
      GifController controller3,
      AnimationController controller4) {
    return [
      BottomNavigationBarItem(
        label: "Home",
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(homeIcon),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(homeIcon, color: kOrange),
        ),
      ),
      BottomNavigationBarItem(
        label: "Favourites",
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(ordersIcon),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(ordersOrangeIcon),
        ),
      ),
      BottomNavigationBarItem(
        label: "Cart",
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(fleetIcon),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(fleetIcon, color: kOrange),
        ),
      ),
      BottomNavigationBarItem(
        label: "Profile",
        icon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(profileIcon),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(profileIcon, color: kOrange),
        ),
      ),
    ];
  }
}
