import 'package:boilerplate/controller/app_controller.dart';
import 'package:boilerplate/pages/chat.dart';
import 'package:boilerplate/pages/feed.dart';
import 'package:boilerplate/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: AppController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: IndexedStack(
          index: controller.navIndex.value,
          children: const [
            FeedPage(),
            ChatPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.navIndex.value,
          onDestinationSelected: ((value) {
            controller.navIndex.value = value;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.feed),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
