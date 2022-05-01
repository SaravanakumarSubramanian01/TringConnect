import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tringconnect/controller/Calendar.dart';
import 'package:tringconnect/controller/Chat.dart';
import 'package:tringconnect/controller/CreatePost.dart';
import 'package:tringconnect/controller/Dashboard.dart';
import 'package:tringconnect/controller/FolderView.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/NotificationButton.dart';
import 'package:tringconnect/widgets/StatefulButton.dart';

import '../utils/Service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

List<Widget> widget = <Widget>[
  const Dashboard(),
  const Calendar(),
  const CreatePost(),
  const FolderView(),
  const Chat(),
];

class HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: CustomColor.bgGrey,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState?.openEndDrawer();
            } else {
              scaffoldKey.currentState?.openDrawer();
            }
          },
          child: const StatefulButton(
            activeIcon: Images.hamburgerGreen,
            inActiveIcon: Images.hamburgerBlack,
            resetState: false,
          ),
        ),
        title: Center(
          child: SvgPicture.asset(
            Images.appLogo,
            height: 24,
          ),
        ),
        actions: const [
         NotificationButton(hasUnReadNotification: true),
          StatefulButton(
            activeIcon: Images.searchGreen,
            inActiveIcon: Images.searchBlack,
            resetState: false,),
        ],
      ),
      body: widget[selectedTabIndex],
      drawer: SafeArea(
        bottom: false,
        child: Drawer(
            elevation: 0,
            child: appDrawer() // Populate the Drawer in the next step.
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColor.primaryGreen,
        currentIndex: selectedTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          bottomTabItem(Images.homeFilled, Images.homeOutline),
          bottomTabItem(Images.calendarFilled, Images.calendarOutline),
          bottomTabItem(Images.addPostFilled, Images.addPostOutline),
          bottomTabItem(Images.folderFilled, Images.folderOutline),
          bottomTabItem(Images.chatFilled, Images.chatOutline),
        ],
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
      ),
    );
  }
}

BottomNavigationBarItem bottomTabItem(activeIcon, icon) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(icon),
    label: "",
    activeIcon: SvgPicture.asset(activeIcon),
  );
}

ListView appDrawer() {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      ListTile(
        title: const Text('Profile'),
        onTap: () {},
      ),
      ListTile(
        title: const Text('Settings'),
        onTap: () {},
      ),
    ],
  );
}
