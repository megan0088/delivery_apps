import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "User Profile",
              ),
              Tab(
                text: "Resto profile",
              ),
            ],
          ),
          title: const Text('Order List'),
          actions: [
            IconButton(
              onPressed: () => controller.doLogout(),
              icon: const Icon(
                Icons.logout,
                size: 24.0,
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            UserProfileView(),
            VendorProfileView(),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
