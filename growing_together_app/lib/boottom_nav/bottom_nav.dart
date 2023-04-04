import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'button.dart';
import 'nav_options.dart';
import '../ui_utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  final Function screenChangeCallback;
  const BottomNavBar({super.key, required this.screenChangeCallback});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currInd;

  @override
  void initState() {
    currInd = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
        selectedIndex: currInd,
          rippleColor: MyColors.accent1, // tab button ripple color when pressed
          hoverColor: MyColors.accent1, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 20,
          tabActiveBorder: Border.all(color: MyColors.white, width: 0), // tab button border
          tabBorder: Border.all(color: MyColors.white, width: 0), // tab button border
          // tabShadow: [BoxShadow(color: MyColors.white.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 4, // the tab button gap between icon and text
          color: MyColors.accent3, // unselected icon color
          activeColor: MyColors.white, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: MyColors.accent2, // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), // navigation bar padding
          tabs: NavOptions.navBarTitles.map((e) => GButton(icon: NavOptions.navBarIcons[e]!, text: e)).toList(),
          onTabChange: (int i) {
            setState(() {
              currInd = i;
            });
            widget.screenChangeCallback(i);
            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => NavOptions.navBarOptions[NavOptions.navBarTitles[i]]!));
          },
          // [
          //   GButton(
          //     icon: Icons.home,
          //     text: 'Home',
          //   ),
          //   GButton(
          //     icon: Icons.calendar_month_outlined,
          //     text: 'Likes',
          //   ),
          //   GButton(
          //     icon: Icons.search,
          //     text: 'Search',
          //   ),
          //   GButton(
          //     icon: Icons.account_circle_rounded,
          //     text: 'Profile',
          //   )
          // ]
      ),
    );

    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: MyColors.accent3,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      child: ListView.builder(
        itemCount: NavOptions.navBarTitles.length,
        itemBuilder: (_, i) {
          return BottomNavButton(name: NavOptions.navBarTitles[i]);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
