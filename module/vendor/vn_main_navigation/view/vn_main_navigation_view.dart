import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class VnMainNavigationView extends StatefulWidget {
  const VnMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, VnMainNavigationController controller) {
    controller.view = this;

    /*
   TODO: Implement this @ controller
   int selectedIndex = 0;
   updateIndex(int newIndex) {
   selectedIndex = newIndex;
   setState(() {});
   }
   */
    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            const VnDashboardView(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            const ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "User",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<VnMainNavigationView> createState() => VnMainNavigationController();
}
